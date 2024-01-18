#include <iostream>
#include "stb_image.h"
#include "texture.h"

void Texture::loadTexture(const std::string &file_path, bool gamma, bool set_flip)
{
    glGenTextures(1, &id);
    stbi_set_flip_vertically_on_load(set_flip);
    int width, height, nrComponents;
    unsigned char *data = stbi_load(file_path.c_str(), &width, &height, &nrComponents, 0);
    if (data)
    {
        GLenum format_inter, format;
        if (nrComponents == 1)
        {
            format_inter = GL_RED;
            format = GL_RED;
        }
        else if (nrComponents == 3)
        {
            format = GL_RGB;
            if (gamma)
                format_inter = GL_SRGB;
            else
                format_inter = GL_RGB;
        }
        else if (nrComponents == 4)
        {
            format = GL_RGBA;
            if (gamma)
                format_inter = GL_SRGB8_ALPHA8;
            else
                format_inter = GL_RGBA;
        }

        glBindTexture(GL_TEXTURE_2D, id);
        glTexImage2D(GL_TEXTURE_2D, 0, format_inter, width, height, 0, format, GL_UNSIGNED_BYTE, data);
        glGenerateMipmap(GL_TEXTURE_2D);

        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

        glBindTexture(GL_TEXTURE_2D, 0);
        stbi_image_free(data);
    }
    else
    {
        std::cout << "Texture failed to load at path: " << file_path << std::endl;
        stbi_image_free(data);
    }
}

void Texture::loadHdr(const std::string &file_path, bool set_flip)
{
    stbi_set_flip_vertically_on_load(set_flip);

    int width, height, nrComponents;
    float *data = stbi_loadf(file_path.c_str(), &width, &height, &nrComponents, 0);
    if (data)
    {
        glGenTextures(1, &id);
        glBindTexture(GL_TEXTURE_2D, id);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB16F, width, height, 0, GL_RGB, GL_FLOAT, data); // note how we specify the texture's data value to be float

        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

        glBindTexture(GL_TEXTURE_2D, 0);

        stbi_image_free(data);
    }
    else
    {
        std::cout << "Failed to load HDR image." << std::endl;
    }
}

unsigned int textureFromFile(const std::string &file, const std::string &directory, bool gamma)
{
    std::string file_path = directory + '/' + file;

    unsigned int textureID;
    glGenTextures(1, &textureID);

    int width, height, nrComponents;
    unsigned char *data = stbi_load(file_path.c_str(), &width, &height, &nrComponents, 0);
    if (data)
    {
        GLenum format_inter, format;
        if (nrComponents == 1)
        {
            format_inter = GL_RED;
            format = GL_RED;
        }
        else if (nrComponents == 3)
        {
            format = GL_RGB;
            if (gamma)
                format_inter = GL_SRGB;
            else
                format_inter = GL_RGB;
        }
        else if (nrComponents == 4)
        {
            format = GL_RGBA;
            if (gamma)
                format_inter = GL_SRGB8_ALPHA8;
            else
                format_inter = GL_RGBA;
        }

        glBindTexture(GL_TEXTURE_2D, textureID);
        glTexImage2D(GL_TEXTURE_2D, 0, format_inter, width, height, 0, format, GL_UNSIGNED_BYTE, data);
        glGenerateMipmap(GL_TEXTURE_2D);

        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

        stbi_image_free(data);
    }
    else
    {
        std::cout << "Texture failed to load at path: " << file_path << std::endl;
        stbi_image_free(data);
    }

    return textureID;
}

unsigned int textureFromHdr(const std::string &file, const std::string &directory, bool set_flip)
{
    stbi_set_flip_vertically_on_load(set_flip);

    std::string file_path = directory + '/' + file;
    int width, height, nrComponents;
    float *data = stbi_loadf(file_path.c_str(), &width, &height, &nrComponents, 0);
    unsigned int hdr_texture;
    if (data)
    {
        glGenTextures(1, &hdr_texture);
        glBindTexture(GL_TEXTURE_2D, hdr_texture);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB16F, width, height, 0, GL_RGB, GL_FLOAT, data); // note how we specify the texture's data value to be float

        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

        stbi_image_free(data);
    }
    else
    {
        std::cout << "Failed to load HDR image." << std::endl;
    }
    return hdr_texture;
}
