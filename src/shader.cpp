#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include "shader.h"

void Shader::setPbrUniforms(Screen_Size &size)
{
    use();
    setVec2("shadowmapSize", glm::vec2(size.width, size.height));
    setInt("albedoMap", 0);
    setInt("metallicMap", 1);
    setInt("roughnessMap", 2);
    setInt("normalMap", 3);
    setInt("aoMap", 4);

    setInt("irradianceMap", 5);
    setInt("prefilterMap", 6);
    setInt("brdf_LUT", 7);
    setInt("KC_LUT", 8);
    setInt("KC_average_LUT", 9);
    setInt("fresnel_average", 10);

    setInt("shadowMap", 11);
}
void Shader::setSSRUniforms(Screen_Size &size, float znear, float zfar)
{
    use();
    setInt("colorTexture", 0);
    setInt("positionTexture", 1);
    setInt("normalTexture", 2);
    setInt("depthTexture",3);

    setFloat("znear", znear);
    setFloat("zfar", zfar);
    setInt("width", size.width);
    setInt("height", size.height);
}

void Shader::setBackgroundUniforms()
{
    use();
    setInt("environmentMap", 0);
}