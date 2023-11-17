function distortionShader_init() {
	distort_surface = -1;
	distort_tex_surface = -1;
	distort_tex = -1;
	distort_shader = shd_distortion;

	u_distort_tex = shader_get_sampler_index(distort_shader, "distort_tex");
	u_blend_color = shader_get_uniform(distort_shader, "blend_color");
	u_distort_strength = shader_get_uniform(distort_shader, "strength");
}

function distortionShader_set(_blendColorVec3, _strength = 0.005) {
	shader_set(distort_shader);
	texture_set_stage(u_distort_tex, distort_tex);
	shader_set_uniform_f_array(u_blend_color, _blendColorVec3);
	shader_set_uniform_f(u_distort_strength, _strength);
}

function distortionShader_prepareTexture(_drawFunction) {
	if (surface_exists(distort_tex_surface)) {
		surface_set_target(distort_tex_surface);
			draw_clear_alpha(c_black, 1);
			_drawFunction();
		surface_reset_target();
		distort_tex = surface_get_texture(distort_tex_surface);
	} else {
		distort_tex_surface = surface_create(global.vw, global.vh);	
	}	
}

function distortionShader_isReady() {
	return surface_exists(distort_surface) && distort_tex != -1;
}