// Drawing props
shader_set(shd_fadeColor);
shader_set_uniform_f_array(u_color, c_water_depth_vec3);
var startPos = (ground.props.row.count / 2) + 1
	for (var i = startPos; i<ground.props.row.count; i++) {
		shader_set_uniform_f(u_pwr, ground.props.row.fade[i]);
		for (var j=0; j<array_length(ground.props.row.data[i]); j++) {
			var prop = ground.props.row.data[i][j];
			draw_sprite_ext(prop.sprite, prop.index, prop.drawX, prop.y, prop.flip, 1, 0, c_front, 1);
		}
	}
shader_reset();

// Drawing ground
draw_primitive_begin(pr_trianglestrip)
for (var i=0; i<ground.unit.count-1; i++) {
	var _point = ground.points[i];
	draw_vertex_color(ground.xLow[i], _point + 32, c_water_depth, 1);
	draw_vertex_color(ground.xLow[i], room_height, c_water_depth, 1);	
}
draw_primitive_end();