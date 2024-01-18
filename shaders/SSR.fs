#version 330 core
out vec4 FragColor;

in vec2 TexCoords;

uniform sampler2D colorTexture;
uniform sampler2D positionTexture;
uniform sampler2D normalTexture;
uniform sampler2D depthTexture;
uniform vec3 cameraPosition;

uniform float znear;
uniform float zfar;
uniform int width;
uniform int height;

uniform mat4 view;
uniform mat4 projection;

float LinearizeDepth(float depth)
{
    float z=depth*2.-1.;// Back to NDC
    return(2.*znear*zfar)/(zfar+znear-z*(zfar-znear));
}
vec3 fresnelSchlick(float cosTheta,vec3 F0)
{
    return F0+(1.-F0)*pow(clamp(1.-cosTheta,0.,1.),5.);
}

float getZ(vec3 world_pos)
{
    vec4 temp=projection*view*vec4(world_pos,1.);
    float depth=temp.z/temp.w;
    depth=depth*.5+.5;
    depth=(2.*znear*zfar)/(zfar+znear-depth*(zfar-znear));
    return depth;
}

vec3 world2screen(vec3 world_pos)
{
    vec4 temp=view*vec4(world_pos,1.);
    if(temp.z<0.)
    temp/=temp.z;
    temp=projection*temp;
    vec3 screen_pos=temp.xyz/temp.w;
    screen_pos=screen_pos*.5+.5;
    return screen_pos;
}

void main()
{
    vec3 framecolor=texture(colorTexture,TexCoords).rgb;
    vec4 Pos=texture(positionTexture,TexCoords);
    vec4 N=texture(normalTexture,TexCoords);
    
    vec3 normal=N.xyz;
    float roughness=N.w;
    vec3 worldPos=Pos.xyz;
    float metallic=Pos.w;
    
    if(length(normal)<.1)
    {
        FragColor=vec4(framecolor,1.);
        return;
    }
    
    vec3 viewDir=normalize(cameraPosition-worldPos);
    vec3 reflectDir=normalize(reflect(-viewDir,normal));
    
    vec3 F0=vec3(.0);
    F0=mix(F0,vec3(1.),metallic);
    vec3 F=fresnelSchlick(max(dot(normal,viewDir),0.),F0);
    
    vec3 start_world=worldPos;
    vec3 end_world=start_world+reflectDir;
    vec2 corr_xy=floor(TexCoords.xy*vec2(width,height))/vec2(width,height)+.25/vec2(width,height);
    vec3 start_screen=vec3(corr_xy,textureLod(depthTexture,TexCoords,0.));
    vec3 end_screen=world2screen(end_world);
    vec3 reflect_screen=normalize(end_screen-start_screen);
    reflect_screen/=length(reflect_screen.xy)*sqrt(float(width)*float(width)+float(height)*float(height));
    
    vec3 catchColor=vec3(0.,0.,0.);
    bool catch=false;
    vec3 current_screen=start_screen+2.0*reflect_screen;
    float mip_level=0.;
    for(int i=0;i<width+height;i++)
    {
        float closet_depth=textureLod(depthTexture,current_screen.xy,mip_level).r;
        
        if(current_screen.x<0.||current_screen.x>1.||
        current_screen.y<0.||current_screen.y>1.||
        current_screen.z<0.||current_screen.z>1.)
        {
            break;
        }
        
        if(current_screen.z>closet_depth)
        {
            if(mip_level<0.1)
            {
                catch=true;
                catchColor=vec3(texture(colorTexture,current_screen.xy));
                break;
            }
            current_screen-=reflect_screen;
            reflect_screen/=2.;
            mip_level-=1.;
        }
        else
        {
            mip_level+=1.0;
            reflect_screen*=2.;
        }
        current_screen+=reflect_screen;
    }
    if(catch)
    FragColor=vec4(mix(framecolor,catchColor,F*(1.-roughness)),1.);
    else
    FragColor=vec4(framecolor,1.);
};