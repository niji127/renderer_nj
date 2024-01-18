#version 330 core
out vec3 FragColor;
in vec2 TexCoords;

uniform sampler2D fresnel_map;
uniform int LUT_size;

vec3 fresnelSchlick(float cosTheta,vec3 F0)
{
    return F0+(1.-F0)*pow(clamp(1.-cosTheta,0.,1.),5.);
}

void main()
{
    float dx=1./float(LUT_size);
    vec3 result=vec3(0.0);
    vec3 F0=texture(fresnel_map,TexCoords).rgb;
    for(int i=0;i<LUT_size;i++)
    {
        float sinx=(float(i)+.5)*dx;
        float cosx=sqrt(1.-sinx*sinx);
        
        vec3 F=fresnelSchlick(cosx,F0);
        result+=2.0*F*sinx;
    }
    result*=dx;
    FragColor=result;
}