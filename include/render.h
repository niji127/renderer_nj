#ifndef _RENDER_H
#define _RENDER_H

#include "texture.h"
#include "shader.h"
#include "object.h"
#include "material.h"
#include "screen.h"
Texture rec2cube(Shader &shader, Texture &env_rec, Screen_Size &size);
Texture computeBRDFLUT(Shader &brdf_shader, Screen_Size &size);
Texture computePrefilterMap(Shader &prefilter_shader, Screen_Size &size, Texture &env_cubemap);
Texture computeIrradianceMap(Shader &irradiance_shader, Screen_Size &size, Texture &env_cubemap);

Texture computeKullaContyLUT(Shader &KC_shader, Screen_Size &size);
Texture computeKullaContyAverageLUT(Shader &KC_shader, Screen_Size &size, Texture &KC_map);
Texture computeFresnelAverage(Shader &KC_shader, Screen_Size &size, Material &material);

Texture generateShadowMap(unsigned int &shadowmap_FBO, Screen_Size &size);

Texture generateFrameColor(unsigned int &frameFBO, Screen_Size &size);
Texture generateFrameDepth(unsigned int &frameFBO, Screen_Size &size);
Texture generateFramePosition(unsigned int &frameFBO, Screen_Size &size);
Texture generateFrameNormal(unsigned int &frameFBO, Screen_Size &size);
void bindFrameAttachments();

#endif