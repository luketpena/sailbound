draw_primitive_begin(pr_trianglestrip);
	for (var i=minMax.iMin; i<minMax.iMax; i++) {
		var point = points[i];
		draw_vertex_color(point.x, point.y, c_water_depth, 1);
		draw_vertex_color(point.x, bottomY, c_black, 1);
	}
draw_primitive_end();


var _yy = getPositionY(mouse_x);
draw_set_color(c_red);
draw_set_alpha(1);
draw_circle(mouse_x, _yy, 16, false);