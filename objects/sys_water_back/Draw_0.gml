shader_set(shd_maxAlpha);
var texture = global.water_texture;
var water_point_y = sys_water.water_point_y;

if (texture!=noone) {
	//>> Back wall

	//draw_primitive_begin(pr_trianglestrip);
	//	for (var i=0; i<=water_num; i++) {
	//		draw_vertex_color(water_draw_x_top[i],room_height,global.c_water_depth,1);
	//		draw_vertex_color(water_draw_x_top[i],water_point_y[i]-global.water_center_y,global.c_water_depth,1);
	//	}
	//draw_primitive_end();
	
	//>> Top-left
	draw_primitive_begin_texture(pr_trianglestrip,texture);
		for (var i=0; i<=water_halfNum; i++) {	
			draw_vertex_texture_colour(water_point_x[i],water_point_y[i]-.2,water_texture_x[i],.5,c_white,water_alpha_mid);
			draw_vertex_texture_colour(water_draw_x_top[i],water_point_y[i]-global.water_center_y,water_texture_x[i],0,c_white,1);
		}
	draw_primitive_end();

	//>> Top-right
	draw_primitive_begin_texture(pr_trianglestrip,texture);
		for (var i=water_num; i>=water_halfNum; i--) {
			draw_vertex_texture_colour(water_point_x[i],water_point_y[i]-.2,water_texture_x[i],.5,c_white,water_alpha_mid);
			draw_vertex_texture_colour(water_draw_x_top[i],water_point_y[i]-global.water_center_y,water_texture_x[i],0,c_white,1);
		}
	draw_primitive_end();
}
shader_reset();