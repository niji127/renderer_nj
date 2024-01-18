#version 330 core
layout(location=0)out vec4 FragColor;
layout(location=1)out vec4 gPosition;
layout(location=2)out vec4 gNormal;
layout(location=3)out vec4 gDepth;
in vec2 TexCoords;
in vec3 WorldPos;
in vec3 Normal;
in vec4 LightSpacePos;

// material parameters
uniform sampler2D albedoMap;
uniform sampler2D metallicMap;
uniform sampler2D roughnessMap;
uniform sampler2D normalMap;
uniform sampler2D aoMap;

// IBL
uniform samplerCube irradianceMap;
uniform samplerCube prefilterMap;
uniform sampler2D brdf_LUT;
uniform sampler2D KC_LUT;
uniform sampler2D KC_average_LUT;
uniform sampler2D fresnel_average;

// shadow
uniform sampler2D shadowMap;

uniform vec3 camPos;
uniform float roughness_uniform;
uniform float fresnel_uniform;
uniform bool has_KC;
uniform vec2 shadowmapSize;

const float PI=3.14159265359;

float RadicalInverse_VdC(uint bits)
{
    bits=(bits<<16u)|(bits>>16u);
    bits=((bits&0x55555555u)<<1u)|((bits&0xAAAAAAAAu)>>1u);
    bits=((bits&0x33333333u)<<2u)|((bits&0xCCCCCCCCu)>>2u);
    bits=((bits&0x0F0F0F0Fu)<<4u)|((bits&0xF0F0F0F0u)>>4u);
    bits=((bits&0x00FF00FFu)<<8u)|((bits&0xFF00FF00u)>>8u);
    return float(bits)*2.3283064365386963e-10;// / 0x100000000
}

vec2 Hammersley(uint i,uint N)
{
    return vec2(float(i)/float(N),RadicalInverse_VdC(i));
}

vec2 samplePoisson(vec2 Xi)
{
    vec2 sample_vec;
    float theta=2.*PI*Xi.x;
    float r=Xi.y;
    sample_vec.x=r*cos(theta);
    sample_vec.y=r*sin(theta);
    return sample_vec;
}

float DistributionGGX(vec3 N,vec3 H,float roughness)
{
    float a=roughness*roughness;
    float a2=a*a;
    float NdotH=max(dot(N,H),0.);
    float NdotH2=NdotH*NdotH;
    
    float nom=a2;
    float denom=(NdotH2*(a2-1.)+1.);
    denom=PI*denom*denom;
    
    return nom/denom;
}

float GeometrySchlickGGX(float NdotV,float roughness)
{
    float r=(roughness+1.);
    float k=(r*r)/8.;
    float nom=NdotV;
    float denom=NdotV*(1.-k)+k;
    
    return nom/denom;
}

float GeometrySmith(vec3 N,vec3 V,vec3 L,float roughness)
{
    float NdotV=max(dot(N,V),0.);
    float NdotL=max(dot(N,L),0.);
    float ggx2=GeometrySchlickGGX(NdotV,roughness);
    float ggx1=GeometrySchlickGGX(NdotL,roughness);
    
    return ggx1*ggx2;
}

vec3 fresnelSchlick(float cosTheta,vec3 F0)
{
    return F0+(1.-F0)*pow(clamp(1.-cosTheta,0.,1.),5.);
}

vec3 getNormalFromMap()
{
    vec3 tangentNormal=texture(normalMap,TexCoords).xyz*2.-1.;
    
    vec3 Q1=dFdx(WorldPos);
    vec3 Q2=dFdy(WorldPos);
    vec2 st1=dFdx(TexCoords);
    vec2 st2=dFdy(TexCoords);
    
    vec3 N=normalize(Normal);
    vec3 T=normalize(Q1*st2.t-Q2*st1.t);
    vec3 B=-normalize(cross(N,T));
    mat3 TBN=mat3(T,B,N);
    
    return normalize(TBN*tangentNormal);
}

float Chebyshev(float Ex,float variance,float t)
{
    float nom=variance;
    float denom=variance+(t-Ex)*(t-Ex);
    return clamp(nom/denom,0.,1.);
}

float ShadowCalculation(vec4 LightSpacePos)
{
    vec3 projCoords=LightSpacePos.xyz/LightSpacePos.w;
    projCoords=projCoords*.5+.5;
    float currentDepth=projCoords.z;
    
    float sum=0.0;
    float height=0.0;
    int search_size=5;
    for(int i=-search_size;i<search_size;i++)
    {
        for(int j=-search_size;j<search_size;j++)
        {
            vec2 sample_pos=projCoords.xy+vec2(float(10*i)/shadowmapSize.x,float(10*j)/shadowmapSize.y);
            float closestDepth=textureLod(shadowMap,sample_pos,0.).r;
            if (currentDepth-2./shadowmapSize.x>closestDepth)
            {
                height+=closestDepth;
                sum+=1.0;
            }
        }
    }
    height/=sum;
    float dis=max(0.0,currentDepth-height);
    
    float radius=0.2*dis*shadowmapSize.x;
    float shadow=0.;
    uint sample_num=100u;
    for(uint i=0u;i<sample_num;i++)
    {
        vec2 Xi=Hammersley(i,sample_num);
        vec2 sample_pos=projCoords.xy+radius*samplePoisson(Xi)/shadowmapSize;
        float closestDepth=textureLod(shadowMap,sample_pos,0.).r;
        if(currentDepth-2./shadowmapSize.x>closestDepth)
            shadow+=1.;
    }
    shadow/=sample_num;
    return shadow;
}

void main()
{
    vec3 N=getNormalFromMap();
    vec3 V=normalize(camPos-WorldPos);
    vec3 L=reflect(-V,N);
    
    vec3 F0=vec3(.04);
    float metallic=texture(metallicMap,TexCoords).r;
    float roughness=texture(roughnessMap,TexCoords).r;
    // float roughness=roughness_uniform;
    vec3 albedo=texture(albedoMap,TexCoords).rgb;
    float ao=texture(aoMap,TexCoords).r;
    F0=mix(F0,albedo,metallic);
    
    vec3 F=fresnelSchlick(max(dot(N,V),0.),F0);
    
    const float MAX_REFLECTION_LOD=4.;
    vec3 prefilteredColor=textureLod(prefilterMap,L,roughness*MAX_REFLECTION_LOD).rgb;
    vec2 brdf=texture(brdf_LUT,vec2(max(dot(N,V),0.),roughness)).rg;
    vec3 brdf_dir=F*brdf.x+brdf.y;
    
    float NdotV=max(dot(N,V),0.);
    float sin_out=sqrt(1.-NdotV*NdotV);
    float NdotL=max(dot(N,L),0.);
    float sin_in=sqrt(1.-NdotL*NdotL);
    
    vec3 brdf_indir=vec3(0.);
    
    if(has_KC)
    {
        float Ei=texture(KC_LUT,vec2(sin_in,roughness)).r;
        float Ea=texture(KC_average_LUT,vec2(0.,roughness)).r;
        vec3 Fa=texture(fresnel_average,TexCoords).rgb;
        brdf_indir=vec3(1.-Ei);
        brdf_indir*=(Ea*Fa)/(1.-Fa*(1.-Ea));
    }
    
    vec3 kS=F;
    vec3 kD=1.-kS;
    kD*=1.-metallic;
    vec3 irradiance=textureLod(irradianceMap,N,0.).rgb;
    vec3 diffuse=kD*irradiance*albedo;
    
    vec3 specular=prefilteredColor*(brdf_dir+brdf_indir);
    
    float shadow=ShadowCalculation(LightSpacePos);
    vec3 color=(diffuse+specular)*ao*(1.0-0.98*shadow);
    color=color/(color+vec3(1.));
    color=pow(color,vec3(1./2.2));
    FragColor=vec4(color,1.);
    gNormal=vec4(N,roughness);
    gPosition=vec4(WorldPos,metallic);
    gDepth=vec4(gl_FragCoord.z);
}