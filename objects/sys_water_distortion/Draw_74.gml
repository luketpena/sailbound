if (surface_exists(distort_surface)) {
	surface_set_target(distort_surface);
		gpu_set_tex_filter_ext(u_distort_tex,true);

		shader_set(distort_shader);
			texture_set_stage(u_distort_tex,distort_tex);
			shader_set_uniform_f(u_time,time);
			shader_set_uniform_f_array(u_blend_color,blend_color);
			draw_surface_ext(application_surface,0,0,1,1,0,c_white,1);
		shader_reset();

		gpu_set_tex_filter(false);
		draw_surface_ext(sys_water.cutout_top_surface,-global.vx,0,1,1,0,c_black,1);
	surface_reset_target();
	
	shader_set(shd_subtract);
		draw_surface_ext(distort_surface,0,0,1,1,0,c_white,1);
	shader_reset();
} else {
	distort_surface = surface_create(global.vw,global.vh);	
}