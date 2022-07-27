draw_set_color(c_white);
draw_set_alpha(1);

shader_set(shd_maxAlpha);
if (tex != null) {
	// Left side
	draw_primitive_begin_texture(pr_trianglestrip, tex);
	for (var i=0; i<=unit.midCount; i++) {
		var point = points[i];

		draw_vertex_texture(xTop[i], point-32, texture.xtex[i], 0);
		draw_vertex_texture(xLow[i], point+32, texture.xtex[i], 1);
	}
	draw_primitive_end();
	
	// Right side
	draw_primitive_begin_texture(pr_trianglestrip, tex);
	for (var i=unit.count-2; i>=unit.midCount; i--) {
		var point = points[i];

		draw_vertex_texture(xLow[i], point+32, texture.xtex[i], 1);
		draw_vertex_texture(xTop[i], point-32, texture.xtex[i], 0);
		
	}
	draw_primitive_end();
}
shader_reset();

// Back half of props
shader_set(shd_fadeColor);
shader_set_uniform_f_array(u_color, c_water_depth_vec3);
for (var i = 0;  i< props.row.count/2; i++) {
	
	for (var j=0; j<array_length(props.row.data[i]); j++) {
		var prop = props.row.data[i][j];
		shader_set_uniform_f(u_pwr, props.row.fade[i]);
		draw_sprite_ext(prop.sprite, prop.index, prop.drawX, prop.y, prop.flip, 1, 0, c_front, 1);
	}	
}
shader_reset();

draw_primitive_begin(pr_trianglestrip)
for (var i=0; i<unit.count-1; i++) {
	var point = points[i];
	draw_vertex_color(xLow[i], point + 32, c_water_depth, 1);
	draw_vertex_color(xLow[i], room_height, c_water_depth, 1);	
}
draw_primitive_end();
