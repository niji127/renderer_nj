#ifndef MATERIAL_H
#define MATERIAL_H

#include <string>

#include "texture.h"

class Material
{
public:
    Texture albedo, metallic, roughness, normal, ao;

    Material(){};
    Material(const std::string &dir,const std::string &type=".png")
    {
        albedo.loadTexture(dir + "/albedo"+type, true);
        metallic.loadTexture(dir + "/metallic" + type);
        roughness.loadTexture(dir + "/roughness" + type);
        normal.loadTexture(dir + "/normal" + type);
        ao.loadTexture(dir + "/ao" + type);
    }

    void bind();
};

#endif