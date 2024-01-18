#ifndef TEXTURE_H
#define TEXTURE_H

#include <string>

#include <glad/glad.h>
#include <GLFW/glfw3.h>

unsigned int textureFromFile(const std::string &file, const std::string &directory, bool gamma = false);
unsigned int textureFromHdr(const std::string &file, const std::string &directory, bool set_flip = true);

class Texture
{
public:
    unsigned int id;

    void loadTexture(const std::string &dir, bool gamma = false, bool set_flip = false);
    void loadHdr(const std::string &dir, bool set_flip = false);
};

#endif