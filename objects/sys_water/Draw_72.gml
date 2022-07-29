//Creating cutouts for weather and underwater surfaces
if surface_exists(global.cutout_top_surface) {
	surface_set_target(global.cutout_top_surface);
		draw_clear(c_white);
		gpu_set_blendmode(bm_subtract);
		draw_primitive_begin(pr_trianglestrip);
			for (var i=0; i <= water_num; i++) {				
				draw_vertex_color(water_draw_x_low[i] - 64, water_point_y[i]+global.water_center_y-global.vy, c_white, 1);
				draw_vertex_color(water_draw_x_low[i] - 64, global.vh, c_white, 1);
			}
		draw_primitive_end();
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
	
	if surface_exists(cutout_bottom_surface) {
		surface_set_target(cutout_bottom_surface);
			draw_clear_alpha(c_white, 1);
			gpu_set_blendmode(bm_subtract);
				draw_surface_ext(global.cutout_top_surface, 0, 0, 1, 1, 0, c_black, 1);
			gpu_set_blendmode(bm_normal);
		surface_reset_target();
	} else {
		cutout_bottom_surface = surface_create(room_width, global.vh);
	}
} else {
	global.cutout_top_surface = surface_create(room_width, global.vh);	
}
