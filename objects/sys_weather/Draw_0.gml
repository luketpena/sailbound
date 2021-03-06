if (weather_fade>0) {
	if surface_exists(weather_surface) {
		
		//>> Drawing weather to the surface
		surface_set_target(weather_surface);
			draw_clear_alpha(c_white,0);
			
			for (var i=0; i<array_length(droplet_list); i++) {
				var d = droplet_list[i];
				draw_sprite_ext(d.sprite, 0, d.x-global.vx, d.y-global.vy, d.scale, 1, d.angle, c_front, d.alpha);
			}

			
			
			draw_surface_ext(sys_water.cutout_bottom_surface,-global.vx,0,1,1,0,c_black,1);
		surface_reset_target();
		
		//>> Drawing the surface itself
		shader_set(shd_subtract);
			draw_surface_ext(weather_surface,global.vx,global.vy,1,1,0,c_white,weather_fade);
		shader_reset();
		
	} else {
		//>> Creating the surface
		weather_surface = surface_create(global.vw, global.vh);
	}
}


if (fog_fade>0) {
	if surface_exists(fog_surface) {
		surface_set_target(fog_surface);
			draw_sprite_tiled_ext(spr_env_fog,0,fog_position,-global.vy,1,1,c_white,1);
			if instance_exists(target) {
				draw_sprite_ext(spr_fx_flare_300,0,target.x_center_draw,target.y_center_draw-global.vy,1,1,0,c_black,.5);
			}
		surface_reset_target();
		
		shader_set(shd_fog);
		shader_set_uniform_f(u_fog_alpha,fog_alpha*fog_fade);
		shader_set_uniform_f_array(u_fog_color,fog_color_array);
			draw_surface_ext(fog_surface,0,global.vy,1,1,0,c_white,1);
		shader_reset();
	} else {
		fog_surface = surface_create(room_width,global.vh);	
	}
}