#version 330 core
layout(location=0)out vec4 FragColor;
layout(location=1)out vec4 gPosition;
layout(location=2)out vec4 gNormal;
layout(location=3)out vec4 gDepth;
in vec3 WorldPos;

uniform samplerCube environmentMap;

void main()
{
    vec3 envColor=textureLod(environmentMap,WorldPos,0.).rgb;
    
    // HDR tonemap and gamma correct
    envColor=envColor/(envColor+vec3(1.));
    envColor=pow(envColor,vec3(1./2.2));
    
    FragColor=vec4(envColor,1.);
    gNormal=vec4(vec3(0.0),1.0);
    gPosition=vec4(0.0);
    gDepth=vec4(1.0);
}