#version 330 core
out vec2 FragColor;
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
    // note that we use a different k for IBL
    float a=roughness;
    float k=(a*a)/2.;
    
    float nom=NdotV;
    float denom=NdotV*(1.-k)+k;
    
    return nom/denom;
}
// ----------------------------------------------------------------------------
float GeometrySmith(vec3 N,vec3 L,vec3 V,float roughness)
{
    float NdotL=max(dot(N,L),0.);
    float NdotV=max(dot(N,V),0.);
    float ggx2=GeometrySchlickGGX(NdotL,roughness);
    float ggx1=GeometrySchlickGGX(NdotV,roughness);
    
    return ggx1*ggx2;
}
// ----------------------------------------------------------------------------
vec2 IntegrateBRDF(float NdotV,float roughness)
{
    vec3 V;
    V.x=sqrt(1.-NdotV*NdotV);
    V.y=0.;
    V.z=NdotV;
    
    float A=0.;
    float B=0.;
    
    vec3 N=vec3(0.,0.,1.);
    
    const uint SAMPLE_COUNT=1024u;
    for(uint i=0u;i<SAMPLE_COUNT;++i)
    {
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
            float Fc=pow(1.-VdotH,5.);
            
            A+=(1.-Fc)*G_Vis;
            B+=Fc*G_Vis;
        }
    }
    A/=float(SAMPLE_COUNT);
    B/=float(SAMPLE_COUNT);
    return vec2(A,B);
}
// ----------------------------------------------------------------------------
void main()
{
    vec2 integratedBRDF=IntegrateBRDF(TexCoords.x,TexCoords.y);
    FragColor=integratedBRDF;
}