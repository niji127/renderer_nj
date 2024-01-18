#version 330 core
out vec3 FragColor;
in vec2 TexCoords;

const float PI=3.14159265359;
// ----------------------------------------------------------------------------
// http://holger.dammertz.org/stuff/notes_HammersleyOnHemisphere.html
// efficient VanDerCorpus calculation.
float RadicalInverse_VdC(uint bits)
{
    bits=(bits<<16u)|(bits>>16u);
    bits=((bits&0x55555555u)<<1u)|((bits&0xAAAAAAAAu)>>1u);
    bits=((bits&0x33333333u)<<2u)|((bits&0xCCCCCCCCu)>>2u);
    bits=((bits&0x0F0F0F0Fu)<<4u)|((bits&0xF0F0F0F0u)>>4u);
    bits=((bits&0x00FF00FFu)<<8u)|((bits&0xFF00FF00u)>>8u);
    return float(bits)*2.3283064365386963e-10;// / 0x100000000
}
// ----------------------------------------------------------------------------
vec2 Hammersley(uint i,uint N)
{
    return vec2(float(i)/float(N),RadicalInverse_VdC(i));
}
// ----------------------------------------------------------------------------
vec3 ImportanceSampleGGX(vec2 Xi,vec3 N,float roughness)
{
    float a=roughness*roughness;
    
    float phi=2.*PI*Xi.x;
    float cosTheta=sqrt((1.-Xi.y)/(1.+(a*a-1.)*Xi.y));
    float sinTheta=sqrt(1.-cosTheta*cosTheta);
    
    // from spherical coordinates to cartesian coordinates - halfway vector
    vec3 H;
    H.x=cos(phi)*sinTheta;
    H.y=sin(phi)*sinTheta;
    H.z=cosTheta;
    
    // from tangent-space H vector to world-space sample vector
    vec3 up=abs(N.z)<.999?vec3(0.,0.,1.):vec3(1.,0.,0.);
    vec3 tangent=normalize(cross(up,N));
    vec3 bitangent=cross(N,tangent);
    
    vec3 sampleVec=tangent*H.x+bitangent*H.y+N*H.z;
    return normalize(sampleVec);
}
// ----------------------------------------------------------------------------
float GeometrySchlickGGX(float NdotV,float roughness)
{
    float a=roughness;
    float k=(a*a)/2.;
    
    float nom=NdotV;
    float denom=NdotV*(1.-k)+k;
    
    return nom/denom;
}
// ----------------------------------------------------------------------------
float GeometrySmith(vec3 N,vec3 V,vec3 L,float roughness)
{
    float NdotV=max(dot(N,V),0.);
    float NdotL=max(dot(N,L),0.);
    float ggx2=GeometrySchlickGGX(NdotV,roughness);
    float ggx1=GeometrySchlickGGX(NdotL,roughness);
    
    return ggx1*ggx2;
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
// ----------------------------------------------------------------------------
float IntegrateBRDF(float sinnv,float roughness)
{
    vec3 V;
    V.x=0.;
    V.y=-sinnv;
    V.z=sqrt(1.-sinnv*sinnv);
    float NdotV=V.z;
    
    float A=0.;
    
    vec3 N=vec3(0.,0.,1.);
    
    const uint SAMPLE_COUNT=1024u;
    for(uint i=0u;i<SAMPLE_COUNT;++i)
    {
            // generates a sample vector that's biased towards the
            // preferred alignment direction (importance sampling).
            vec2 Xi=Hammersley(i,SAMPLE_COUNT);
            vec3 H=ImportanceSampleGGX(Xi,N,roughness);
            vec3 L=normalize(2.*dot(V,H)*H-V);
        
            float NdotL=max(L.z,0.);
            float NdotH=max(H.z,0.);
            float VdotH=max(dot(V,H),0.);
        
            if(NdotL>0.)
            {
                    float G=GeometrySmith(N,V,L,roughness);
                    float G_Vis=(G*VdotH)/(NdotH*NdotV);
                    A+=G_Vis;
            }
    }
    A/=float(SAMPLE_COUNT);

    return A;
}
// ----------------------------------------------------------------------------
void main()
{
    float integratedBRDF=IntegrateBRDF(TexCoords.x,TexCoords.y);
    FragColor=vec3(integratedBRDF);
}