if (surface_exists(horizon_surface) && surface_exists(twinkle_surface)) {
		surface_set_target(twinkle_surface);
			draw_clear_alpha(c_white, 0);
			var posX =  horizon_twinkle_pos - (global.vx * .1);
			draw_sprite_tiled_ext(spr_env_horizon_twinkle, 0, posX, 0, 1, 1, c_water_horizon, .5 * horizon_twinkle_alpha);
			draw_sprite_tiled_ext(spr_env_horizon_twinkle, 1, posX, 0, 1, 1, c_water_horizon, .5 * (1-horizon_twinkle_alpha));
		surface_reset_target();
		surface_set_target(horizon_surface);
			draw_clear_alpha(c_water_surface, 1);
			
		surface_reset_target();
		
	horizon_texture = surface_get_texture(horizon_surface);
	shader_set(shd_maxAlpha);
		draw_primitive_begin_texture(pr_trianglestrip, horizon_texture);
			draw_vertex_texture_color(x1, y1, 0, 0, c_white, 1);
			draw_vertex_texture_color(x2, y1, 1, 0, c_white, 1);
			draw_vertex_texture_color(x1, y2, 0, 1, c_white, 1);
			draw_vertex_texture_color(x2, y2, 1, 1, c_white, 1);
		draw_primitive_end();
	shader_reset();
	draw_surface_ext(twinkle_surface, x1, y1, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_env_horizon_fade, 0, global.vx, global.horizon_y, global.vw, 1, 0, c_water_horizon, 1);
} else {
	horizon_surface = surface_create(global.vw, 128);
	twinkle_surface = surface_create(global.vw, 24);
}


	
