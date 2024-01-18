#include <iostream>

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>

#include "initiate.h"
#include "shader.h"
#include "camera.h"
#include "model.h"
#include "screen.h"
#include "texture.h"
#include "object.h"
#include "material.h"
#include "render.h"

#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"

int main()
{
    initiate_glfw(3, 3, 4);

    Screen_Size cubemap_size(1024, 1024);
    Screen_Size irradiance_size(32, 32);
    Screen_Size shadowmap_size(4096, 4096);
    Screen_Size LUT_size(1024, 1024);
    float camera_znear = 0.1f;
    float camera_zfar = 100.0f;
    float shadowmap_znear = 0.0f;
    float shadowmap_zfar = 50.0f;

    Screen screen(1920, 1080);
    screen.createWindow();
    Camera *camera = screen.getCamera();
    GLFWwindow *window = screen.window;

    initiate_glad();

    glEnable(GL_DEPTH_TEST);
    glDepthFunc(GL_LEQUAL);
    glEnable(GL_TEXTURE_CUBE_MAP_SEAMLESS);

    // build and compile shaders
    std::string shader_path = "../shaders";
    Shader pbr_shader(shader_path, "pbr.vs", "pbr.fs");
    Shader rec2cube_shader(shader_path, "cubemap.vs", "rec2cube.fs");
    Shader background_shader(shader_path, "background.vs", "background.fs");
    Shader prefilter_shader(shader_path, "cubemap.vs", "prefilter.fs");
    Shader irradiance_shader(shader_path, "cubemap.vs", "irradiance.fs");

    Shader brdf_shader(shader_path, "quad.vs", "brdf.fs");
    Shader KC_shader(shader_path, "quad.vs", "kulla_conty.fs");
    Shader KC_average_shader(shader_path, "quad.vs", "kulla_conty_average.fs");
    Shader fresnel_average_shader(shader_path, "quad.vs", "fresnel_average.fs");

    Shader shadowmap_shader(shader_path, "shadow.vs", "shadow.fs");
    Shader debug_shader(shader_path, "quad.vs", "debug.fs");
    Shader SSR_shader(shader_path, "quad.vs", "SSR.fs");
    Shader mipmap_shader(shader_path, "quad.vs", "mipmap.fs");

    // load textures and models
    std::string resource_path = "../resources";
    std::string texture_path = resource_path + "/textures";
    Material gold_material(texture_path + "/gold");
    Material ground_material(texture_path + "/ground");

    std::string hdr_path = texture_path + "/hdr";
    Texture env_rec;
    env_rec.loadHdr(hdr_path + "/castle.hdr", true);

    std::string model_path = resource_path + "/models";
    Material house_material(model_path + "/house");
    Model house(model_path + "/house", "house.fbx");

    // geometry objects
    Object ball(SPHERE);
    Object cube(CUBE);
    Object quad(QUAD);
    Object plane(PLANE);

    // brdf
    Texture env_cubemap = rec2cube(rec2cube_shader, env_rec, cubemap_size);
    Texture BRDF_LUT = computeBRDFLUT(brdf_shader, LUT_size);
    Texture irradiance_map = computeIrradianceMap(irradiance_shader, irradiance_size, env_cubemap);
    Texture prefilter_map = computePrefilterMap(prefilter_shader, cubemap_size, env_cubemap);

    // Kulla-Conty Approximation
    Texture KC_LUT = computeKullaContyLUT(KC_shader, LUT_size);
    Texture KC_average_LUT = computeKullaContyAverageLUT(KC_shader, LUT_size, KC_LUT);
    Texture gold_fresnel_average = computeFresnelAverage(fresnel_average_shader, LUT_size, gold_material);
    Texture ground_fresnel_average = computeFresnelAverage(fresnel_average_shader, LUT_size, ground_material);
    Texture house_fresnel_average = computeFresnelAverage(fresnel_average_shader, LUT_size, house_material);

    // set uniforms
    pbr_shader.setPbrUniforms(shadowmap_size);
    SSR_shader.setSSRUniforms(screen.size, camera_znear, camera_zfar);

    // SSR
    unsigned int frameFBO;
    glGenFramebuffers(1, &frameFBO);
    Texture frame_color = generateFrameColor(frameFBO, screen.size);
    Texture frame_depth = generateFrameDepth(frameFBO, screen.size);
    Texture frame_position = generateFramePosition(frameFBO, screen.size);
    Texture frame_normal = generateFrameNormal(frameFBO, screen.size);
    bindFrameAttachments();

    unsigned int mipmapFBO;
    glGenFramebuffers(1, &mipmapFBO);

    // shadow
    unsigned int shadowmap_FBO;
    Texture shadow_map = generateShadowMap(shadowmap_FBO, shadowmap_size);

    // reset screen
    int scrWidth, scrHeight;
    glfwGetFramebufferSize(window, &scrWidth, &scrHeight);
    glViewport(0, 0, scrWidth, scrHeight);

    // main renderer
    while (!glfwWindowShouldClose(window))
    {
        screen.processInput();

        glm::mat4 model = glm::mat4(1.0f);
        glm::mat4 view = camera->GetViewMatrix();
        glm::mat4 projection = glm::perspective(glm::radians(camera->zoom), screen.aspect_ratio, camera_znear, camera_zfar);

        // 1.render shadowmap
        glm::vec3 light_pos(10.0f, 10.0f, 10.0f);
        glm::mat4 light_view = glm::lookAt(light_pos, glm::vec3(0.0f), glm::vec3(0.0, 1.0, 0.0));
        glm::mat4 light_project = glm::ortho(-10.0f, 10.0f, -10.0f, 10.0f, shadowmap_znear, shadowmap_zfar);
        glm::mat4 light_space_matrix = light_project * light_view;
        shadowmap_shader.use();
        shadowmap_shader.setMat4("lightSpaceMatrix", light_space_matrix);

        glViewport(0, 0, shadowmap_size.width, shadowmap_size.height);
        glBindFramebuffer(GL_FRAMEBUFFER, shadowmap_FBO);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        model = glm::mat4(1.0f);
        model = glm::scale(model, glm::vec3(0.01f));
        model = glm::rotate(model, glm::radians(90.0f), glm::vec3(0.0f, 1.0f, 0.0f));
        shadowmap_shader.setMat4("model", model);
        house.draw();

        model = glm::mat4(1.0f);
        model = glm::scale(model, glm::vec3(20.0f));
        model = glm::rotate(model, glm::radians(90.0f), glm::vec3(0.0f, 1.0f, 0.0f));
        model = glm::rotate(model, glm::radians(-90.0f), glm::vec3(1.0f, 0.0f, 0.0f));
        shadowmap_shader.setMat4("model", model);
        plane.draw();

        glBindTexture(GL_TEXTURE_2D, shadow_map.id);
        glGenerateMipmap(GL_TEXTURE_2D);

        // 2.render objects
        pbr_shader.use();
        pbr_shader.setMat4("view", view);
        pbr_shader.setVec3("camPos", camera->Position);
        pbr_shader.setMat4("projection", projection);
        pbr_shader.setMat4("lightSpaceMatrix", light_space_matrix);

        glViewport(0, 0, screen.size.width, screen.size.height);
        glBindFramebuffer(GL_FRAMEBUFFER, frameFBO);
        glClearColor(0.2f, 0.3f, 0.3f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        glActiveTexture(GL_TEXTURE5);
        glBindTexture(GL_TEXTURE_CUBE_MAP, irradiance_map.id);
        glActiveTexture(GL_TEXTURE6);
        glBindTexture(GL_TEXTURE_CUBE_MAP, prefilter_map.id);
        glActiveTexture(GL_TEXTURE7);
        glBindTexture(GL_TEXTURE_2D, BRDF_LUT.id);
        glActiveTexture(GL_TEXTURE8);
        glBindTexture(GL_TEXTURE_2D, KC_LUT.id);
        glActiveTexture(GL_TEXTURE9);
        glBindTexture(GL_TEXTURE_2D, KC_average_LUT.id);

        glActiveTexture(GL_TEXTURE11);
        glBindTexture(GL_TEXTURE_2D, shadow_map.id);

        house_material.bind();
        glActiveTexture(GL_TEXTURE10);
        glBindTexture(GL_TEXTURE_2D, house_fresnel_average.id);
        model = glm::mat4(1.0f);
        model = glm::scale(model, glm::vec3(0.01f));
        model = glm::rotate(model, glm::radians(90.0f), glm::vec3(0.0f, 1.0f, 0.0f));
        pbr_shader.setMat4("model", model);
        pbr_shader.setBool("has_KC", true);
        pbr_shader.setMat3("normalMatrix", glm::transpose(glm::inverse(glm::mat3(model))));
        house.draw();

        ground_material.bind();
        glActiveTexture(GL_TEXTURE10);
        glBindTexture(GL_TEXTURE_2D, ground_fresnel_average.id);
        model = glm::mat4(1.0f);
        model = glm::scale(model, glm::vec3(20.0f));
        model = glm::rotate(model, glm::radians(90.0f), glm::vec3(0.0f, 1.0f, 0.0f));
        model = glm::rotate(model, glm::radians(-90.0f), glm::vec3(1.0f, 0.0f, 0.0f));
        pbr_shader.setMat4("model", model);
        pbr_shader.setBool("has_KC", true);
        pbr_shader.setMat3("normalMatrix", glm::transpose(glm::inverse(glm::mat3(model))));
        plane.draw();

        // render skybox
        background_shader.use();
        background_shader.setMat4("view", view);
        background_shader.setMat4("projection", projection);
        glActiveTexture(GL_TEXTURE0);
        glBindTexture(GL_TEXTURE_CUBE_MAP, env_cubemap.id);
        // glBindTexture(GL_TEXTURE_CUBE_MAP, prefilter_map.id);
        // glBindTexture(GL_TEXTURE_CUBE_MAP, irradiance_map.id);
        cube.draw();

        // 3.mipmap of depth
        mipmap_shader.use();
        glBindFramebuffer(GL_FRAMEBUFFER, mipmapFBO);
        glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        glActiveTexture(GL_TEXTURE0);
        glBindTexture(GL_TEXTURE_2D, frame_depth.id);
        int currentWidth = screen.size.width;
        int currentHeight = screen.size.height;
        int numLevels = 1 + (int)floorf(log2f((float)std::max(currentWidth, currentHeight)));

        for (int i = 1; i < numLevels; i++)
        {
            mipmap_shader.setInt("width", currentWidth);
            mipmap_shader.setInt("height", currentHeight);
            mipmap_shader.setInt("depthBuffer", 0);
            mipmap_shader.setInt("level", i - 1);

            currentWidth /= 2;
            currentHeight /= 2;
            currentWidth = currentWidth > 0 ? currentWidth : 1;
            currentHeight = currentHeight > 0 ? currentHeight : 1;

            glViewport(0, 0, currentWidth, currentHeight);
            glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, frame_depth.id, i);
            quad.draw();
        }

        // 4.post-processing (SSR)
        glBindFramebuffer(GL_FRAMEBUFFER, 0);
        glClearColor(0.5f, 0.5f, 0.5f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        glViewport(0, 0, screen.size.width, screen.size.height);
        SSR_shader.use();
        SSR_shader.setMat4("view", view);
        SSR_shader.setMat4("projection", projection);
        SSR_shader.setVec3("cameraPosition", camera->Position);

        glActiveTexture(GL_TEXTURE0);
        glBindTexture(GL_TEXTURE_2D, frame_color.id);
        glActiveTexture(GL_TEXTURE1);
        glBindTexture(GL_TEXTURE_2D, frame_position.id);
        glActiveTexture(GL_TEXTURE2);
        glBindTexture(GL_TEXTURE_2D, frame_normal.id);
        glActiveTexture(GL_TEXTURE3);
        glBindTexture(GL_TEXTURE_2D, frame_depth.id);
        quad.draw();
        glBindFramebuffer(GL_FRAMEBUFFER, 0);

        glfwSwapBuffers(window);
        glfwPollEvents();
    }
    

    // Kulla-Conty test
    /*
    while (!glfwWindowShouldClose(window))
    {
        screen.processInput();

        glm::mat4 model = glm::mat4(1.0f);
        glm::mat4 view = camera->GetViewMatrix();
        glm::mat4 projection = glm::perspective(glm::radians(camera->zoom), screen.aspect_ratio, camera_znear, camera_zfar);

        // render objects (remember to set shadow and roughness)
        pbr_shader.use();
        pbr_shader.setMat4("view", view);
        pbr_shader.setVec3("camPos", camera->Position);
        pbr_shader.setMat4("projection", projection);

        glViewport(0, 0, screen.size.width, screen.size.height);
        glBindFramebuffer(GL_FRAMEBUFFER, 0);
        glClearColor(0.2f, 0.3f, 0.3f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        glActiveTexture(GL_TEXTURE5);
        glBindTexture(GL_TEXTURE_CUBE_MAP, irradiance_map.id);
        glActiveTexture(GL_TEXTURE6);
        glBindTexture(GL_TEXTURE_CUBE_MAP, prefilter_map.id);
        glActiveTexture(GL_TEXTURE7);
        glBindTexture(GL_TEXTURE_2D, BRDF_LUT.id);
        glActiveTexture(GL_TEXTURE8);
        glBindTexture(GL_TEXTURE_2D, KC_LUT.id);
        glActiveTexture(GL_TEXTURE9);
        glBindTexture(GL_TEXTURE_2D, KC_average_LUT.id);

        gold_material.bind();
        glActiveTexture(GL_TEXTURE10);
        glBindTexture(GL_TEXTURE_2D, gold_fresnel_average.id);
        int row = 7;
        for (int i = 0; i < row; i++)
        {
            model = glm::mat4(0.5f);
            model = glm::translate(model, glm::vec3(3.0 * (float)i, 0.0, 0.0));
            float roughness_uniform = (float)i / (float)(row - 1);
            pbr_shader.setFloat("roughness_uniform", roughness_uniform);
            pbr_shader.setBool("has_KC", false);
            pbr_shader.setMat4("model", model);
            pbr_shader.setMat3("normalMatrix", glm::transpose(glm::inverse(glm::mat3(model))));
            ball.draw();
        }
        for (int i = 0; i < row; i++)
        {
            model = glm::mat4(0.5f);
            model = glm::translate(model, glm::vec3(3.0 * (float)i, 0.0, 6.0));
            float roughness_uniform = (float)i / (float)(row - 1);
            pbr_shader.setFloat("roughness_uniform", roughness_uniform);
            pbr_shader.setBool("has_KC", true);
            pbr_shader.setMat4("model", model);
            pbr_shader.setMat3("normalMatrix", glm::transpose(glm::inverse(glm::mat3(model))));
            ball.draw();
        }


        // render skybox
        background_shader.use();
        background_shader.setMat4("view", view);
        background_shader.setMat4("projection", projection);
        glActiveTexture(GL_TEXTURE0);
        glBindTexture(GL_TEXTURE_CUBE_MAP, env_cubemap.id);
        // glBindTexture(GL_TEXTURE_CUBE_MAP, prefilter_map.id);
        // glBindTexture(GL_TEXTURE_CUBE_MAP, irradiance_map.id);
        cube.draw();

        glfwSwapBuffers(window);
        glfwPollEvents();
    }
    */

    // debug check
    /*
    while (!glfwWindowShouldClose(window))
    {
        screen.processInput();

        glm::mat4 model = glm::mat4(1.0f);
        glm::mat4 view = camera->GetViewMatrix();
        glm::mat4 projection = glm::perspective(glm::radians(camera->zoom), screen.aspect_ratio, camera_znear, camera_zfar);

        
        // render BRDF map to screen
        brdf_shader.use();
        glViewport(0, 0, LUT_size.width, LUT_size.height);
        quad.draw();

        // render E map to screen
        KC_shader.use();
        glViewport(0, 0, LUT_size.width, LUT_size.height);
        quad.draw();

        // render E_average map to screen
        KC_average_shader.use();
        glActiveTexture(GL_TEXTURE0);
        glBindTexture(GL_TEXTURE_2D, KC_LUT.id);
        KC_average_shader.setInt("LUT_size", LUT_size.width);
        glViewport(0, 0, LUT_size.width, LUT_size.height);
        quad.draw();

        // render F_average map to screen
        fresnel_average_shader.use();
        glActiveTexture(GL_TEXTURE0);
        glBindTexture(GL_TEXTURE_2D, gold_material.albedo.id);
        fresnel_average_shader.setInt("LUT_size_x", LUT_size.width);
        glViewport(0, 0, LUT_size.width, LUT_size.height);
        quad.draw();

        glViewport(0, 0, shadowmap_size.width, shadowmap_size.height);
        debug_shader.use();
        debug_shader.setFloat("near_plane", camera_znear);
        debug_shader.setFloat("far_plane", camera_zfar);
        glActiveTexture(GL_TEXTURE0);
        glBindTexture(GL_TEXTURE_2D, shadow_map.id);
        quad.draw();
        

        glfwSwapBuffers(window);
        glfwPollEvents();
    }
    */

    glfwTerminate();
    return 0;
}