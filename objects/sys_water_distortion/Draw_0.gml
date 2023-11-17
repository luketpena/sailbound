distortionShader_prepareTexture(function() {
	var yy = -global.vy;
	gpu_set_blendmode(bm_add);
		draw_sprite_tiled_ext(spr_fx_water_distortion, 0, -global.vx + tex_x * 2, yy, 1, 1, c_white, .5);
		draw_sprite_tiled_ext(spr_fx_water_distortion, 0, -global.vx + tex_x, yy, 2, 2, c_white, .5);
	gpu_set_blendmode(bm_normal);
});	

if (distortionShader_isReady()) {
	surface_set_target(distort_surface);
		gpu_set_tex_filter_ext(u_distort_tex, true);

		distortionShader_set(c_water_surface_vec3);
			draw_surface_ext(application_surface, 0, 0, 1, 1, 0, c_white, 1);
		shader_reset();

		gpu_set_tex_filter(false);
		draw_surface_ext(global.cutout_top_surface, 0, 0, 1, 1, 0, c_black, 1);
	surface_reset_target();
	
	shader_set(shd_subtract);
		draw_surface_ext(distort_surface, global.vx, global.vy, 1, 1, 0, c_white, 1);
	shader_reset();
} else {
	distort_surface = surface_create(global.vw, global.vh);	
}