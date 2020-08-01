draw_primitive_begin(pr_trianglestrip);
	for (var i=0; i<=water_num; i++) {
		draw_vertex_color(water_draw_x_top[i],room_height,global.c_water_depth,1);
		draw_vertex_color(water_draw_x_top[i],water_point_y[i]-global.water_center_y,global.c_water_depth,1);
	}
draw_primitive_end();