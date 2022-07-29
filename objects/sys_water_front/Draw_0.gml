///@description Water Front

//>> Front Surface
if surface_exists(front_surface) && surface_exists(global.cutout_top_surface) {
	surface_set_target(front_surface);
		draw_clear_alpha(c_white, 0);
		part_system_drawit(global.ps_water_front);
		draw_surface_ext(global.cutout_top_surface, 0, global.vy, 1, 1, 0, c_black, 1);
	surface_reset_target();
	
	shader_set(shd_subtract);
		draw_surface_ext(front_surface, 0, 0, 1, 1, 0, c_white, 1);
	shader_reset();
} else {
	front_surface = surface_create(room_width, room_height);	
}


shader_set(shd_maxAlpha);
if (global.water_texture != noone) {
	//>>BOTTOM-LEFT
	draw_primitive_begin_texture(pr_trianglestrip, global.water_texture);
		for (var i=0; i<=water_halfNum; i++) {
			draw_vertex_texture_colour(water_point_x[i], sys_water.water_point_y[i]-.2, water_texture_x[i], .5, c_white, water_alpha_mid);
			draw_vertex_texture_colour(water_draw_x_low[i], sys_water.water_point_y[i]+global.water_center_y, water_texture_x[i], 1, c_white, water_alpha_low);	
		}
	draw_primitive_end();
	
	//>>BOTTOM-RIGHT
	draw_primitive_begin_texture(pr_trianglestrip, global.water_texture);
		for (var i=water_num; i >= water_halfNum; i--) {
			draw_vertex_texture_colour(water_point_x[i], sys_water.water_point_y[i]-.2, water_texture_x[i], .5, c_white, water_alpha_mid);
			draw_vertex_texture_colour(water_draw_x_low[i], sys_water.water_point_y[i]+global.water_center_y, water_texture_x[i], 1, c_white, water_alpha_low);
		}	
	draw_primitive_end();
}
shader_reset();