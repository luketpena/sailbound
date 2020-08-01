if surface_exists(surf_particles) {
	surface_set_target(surf_particles);
		draw_clear_alpha(c_black,0);
		part_system_drawit(global.ps_fx_glow);
	surface_reset_target();	
	
} else {
	surf_particles = surface_create(room_width,room_height);	
}

if (surface_exists(surf_ping) && surface_exists(surf_pong) && surface_exists(surf_glow) && surface_exists(surf_effects)) {
	
	var blur_steps_D = 4; //D for Discrete
	var blur_steps = ceil(blur_steps_D/4); //Only half the blur steps

	var kernel_D = 2 * blur_steps_D + 1;
	var kernel   = 2 * blur_steps + 1;

	var sigma_D = .8;
	var sigma = sigma_D * kernel_D / kernel;
	
	surface_set_target(surf_effects);
		draw_clear_alpha(c_black,0);
		draw_tag("fx_glow");
	surface_reset_target();
	
	
	
	surface_set_target(surf_ping);
		draw_clear_alpha(c_black,1);
		draw_surface_ext(surf_particles,-global.vx,-global.vy,1,1,0,c_white,1);
		draw_surface_ext(surf_effects,0,0,1,1,0,c_white,.5+.5*glow_alpha);		
	surface_reset_target();
	
	
	
	gpu_set_tex_filter(true);
		shader_set(shader);
			shader_set_uniform_f(u_blur_steps, blur_steps);
			shader_set_uniform_f(u_texel_size, texel_w, texel_h);
			shader_set_uniform_f(u_sigma, sigma);
		
			//1st pass
			shader_set_uniform_f(u_blur_vector, 1, 0);
			surface_set_target(surf_pong);
				draw_surface_ext(surf_ping,0,0,1,1,0,c_white,1);
			surface_reset_target();
				
		
			//2nd pass
			shader_set_uniform_f(u_blur_vector, 0, 1);
			surface_set_target(surf_glow);
				draw_surface_ext(surf_pong,0,0,1,1,0,c_white,1);
			surface_reset_target();
			
		shader_reset();
	gpu_set_tex_filter(false);

	
} else {
	if (!surface_exists(surf_ping)) surf_ping = surface_create(gui_w,gui_h);	
	if (!surface_exists(surf_pong)) surf_pong = surface_create(gui_w,gui_h);	
	if (!surface_exists(surf_glow)) surf_glow = surface_create(gui_w,gui_h);	
	if (!surface_exists(surf_effects)) surf_effects = surface_create(gui_w,gui_h);	
}

