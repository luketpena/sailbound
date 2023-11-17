if (target == noone || !instance_exists(target)) exit;

shader_set(shd_maxAlpha);
// Drawing the back half
if (surface_exists(target.surf)) {
	var _tex = surface_get_texture(target.surf);
	// Left side
	draw_primitive_begin_texture(pr_trianglestrip, _tex);
	for (var i=0; i<=target.unit.midCount; i++) {
		var point = target.points[i];
		draw_vertex_texture(target.xMid[i], point, target.texture.xtex[i], .5);
		draw_vertex_texture(target.xLow[i], point+32, target.texture.xtex[i], 1);
	}
	draw_primitive_end();
	
	// Right side
	draw_primitive_begin_texture(pr_trianglestrip, _tex);
	for (var i=target.unit.count-2; i>=target.unit.midCount; i--) {
		var point = target.points[i];
		draw_vertex_texture(target.xLow[i], point+32, target.texture.xtex[i], 1);
		draw_vertex_texture(target.xMid[i], point, target.texture.xtex[i], .5);
	}
	draw_primitive_end();
}
shader_reset();

// Drawing props
shader_set(shd_fadeColor);
shader_set_uniform_f_array(u_color, c_water_depth_vec3);
var startPos = (target.props.row.count / 2) + 1
	for (var i = startPos; i<target.props.row.count; i++) {
		shader_set_uniform_f(u_pwr, target.props.row.fade[i]);
		for (var j=0; j<array_length(target.props.row.data[i]); j++) {
			var prop = target.props.row.data[i][j];
			draw_sprite_ext(prop.sprite, prop.index, prop.drawX, prop.y, prop.flip, 1, 0, c_front, 1);
		}
	}
shader_reset();

// Drawing ground
draw_primitive_begin(pr_trianglestrip)
for (var i=0; i<target.unit.count-1; i++) {
	var _point = target.points[i];
	draw_vertex_color(target.xLow[i], _point + 32, c_water_depth, 1);
	draw_vertex_color(target.xLow[i], room_height, c_water_depth, 1);	
}
draw_primitive_end();