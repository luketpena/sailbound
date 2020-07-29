if surface_exists(horizon_surface) {
		surface_set_target(horizon_surface);
			draw_clear_alpha(global.c_water_surface,1);
			draw_sprite_ext(spr_env_horizon_fade,0,0,0,global.vw,1,0,global.c_water_horizon,1);
			draw_sprite_tiled_ext(spr_env_horizon_twinkle,0,-horizon_twinkle_pos,0,1,1,global.c_water_horizon,.25*horizon_twinkle_alpha);
			draw_sprite_tiled_ext(spr_env_horizon_twinkle,1,-horizon_twinkle_pos,0,1,1,global.c_water_horizon,.25*(1-horizon_twinkle_alpha));
		surface_reset_target();
	horizon_texture = surface_get_texture(horizon_surface);
} else {
	horizon_surface = surface_create(global.vw,horizon_height);
}

if (horizon_texture!=noone) {
	shader_set(shd_maxAlpha);
		draw_primitive_begin_texture(pr_trianglestrip,horizon_texture);
			draw_vertex_texture_color(x1,y1,0,0,c_white,1);
			draw_vertex_texture_color(x2,y1,1,0,c_white,1);
			draw_vertex_texture_color(x1,y2,0,1,c_white,1);
			draw_vertex_texture_color(x2,y2,1,1,c_white,1);
		draw_primitive_end();
	shader_reset();
}