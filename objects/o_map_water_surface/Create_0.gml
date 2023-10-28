width = global.vw * 2;
texel_w = 1 / width;
texel_h = 1 / width;

// Surfaces
surf_ping = -1;
surf_pong = -1;
surf_blurred = -1;
surf_posterize = -1;
surf_distort = -1;
surf_distort_tex = -1;

// Shader: Blur
u_blur_steps = shader_get_uniform(shd_blur_glow, "blur_steps");
u_sigma	= shader_get_uniform(shd_blur_glow, "sigma");
u_texel_size = shader_get_uniform(shd_blur_glow, "texel_size");
u_blur_vector = shader_get_uniform(shd_blur_glow, "blur_vector");

blur_steps_D = 10; // D for Discrete
blur_steps = ceil(blur_steps_D / 4); //Only half the blur steps

kernel_D = 2 * blur_steps_D + 1;
kernel   = 2 * blur_steps + 1;

sigma_D = .8;
sigma = sigma_D * kernel_D / kernel;

// Shader: Distortion
distort_tex = noone;
u_distort_tex = shader_get_sampler_index(shd_textureDistortion, "distort_tex");
distort_x = 0; // Animates the motion of the distortion

// Shader: Color gradiant
function get_color1() {
	return color_to_vec3(merge_color(c_water_surface, c_water_depth, .5));
}

color1 = get_color1();
color2 = c_water_surface_vec3;
u_color1 = shader_get_uniform(shd_bwToColorGrad, "color1");
u_color2 = shader_get_uniform(shd_bwToColorGrad, "color2");
