#version 330 core
out vec3 FragColor;
in vec2 TexCoords;

uniform sampler2D KC_map;
uniform int LUT_size_x;

void main()
{
    float dx=1./float(LUT_size_x);
    float result=0.;
    for(int i=0;i<LUT_size_x;i++)
    {
        float x=(float(i)+0.5)*dx;
        result+=2.0*texture(KC_map,vec2(x,TexCoords.y)).r*x;
    }
    result*=dx;
    FragColor=vec3(result);
}