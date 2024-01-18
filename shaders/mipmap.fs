#version 330 core
out vec4 FragColor;

uniform sampler2D depthBuffer;
uniform int level;
uniform int width;
uniform int height;

in vec2 TexCoords;

void main(void)
{
    ivec2 coords=2*ivec2(gl_FragCoord);
    vec4 depth;
    depth.x=texelFetch(depthBuffer,coords,level).r;
    depth.y=texelFetch(depthBuffer,coords+ivec2(1,0),level).r;
    depth.z=texelFetch(depthBuffer,coords+ivec2(1,1),level).r;
    depth.w=texelFetch(depthBuffer,coords+ivec2(0,1),level).r;
    
    float minDepth=min(min(depth.x,depth.y),min(depth.z,depth.w));
    bool has_extra_column=((width&1)!=0);
    bool has_extra_row=((height&1)!=0);
    if(has_extra_column)
    {
        vec3 extra_column;
        extra_column.x=texelFetch(depthBuffer,coords+ivec2(2,0),level).r;
        extra_column.y=texelFetch(depthBuffer,coords+ivec2(2,1),level).r;
        if(has_extra_row)
        {
            extra_column.z=texelFetch(depthBuffer,coords+ivec2(2,2),level).r;
        }
        minDepth=min(min(minDepth,extra_column.z),min(extra_column.x,extra_column.y));
    }
    if(has_extra_row)
    {
        vec3 extra_row;
        extra_row.x=texelFetch(depthBuffer,coords+ivec2(0,2),level).r;
        extra_row.y=texelFetch(depthBuffer,coords+ivec2(1,2),level).r;
        if(has_extra_column)
        {
            extra_row.z=texelFetch(depthBuffer,coords+ivec2(2,2),level).r;
        }
        minDepth=min(min(minDepth,extra_row.z),min(extra_row.x,extra_row.y));
    }
    FragColor=vec4(minDepth);
}