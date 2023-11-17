if (surface_exists(surf)) {
	var _moveOffset = ceiling.getTextureOffset();
	// Draw the surface texture
	surface_set_target(surf);
		draw_sprite_tiled_ext(edgeSprite, 0, ceiling.texture.offset - ceiling.offset, height, 1, 1, c_white, 1);
		draw_sprite_ext(s_pixel, 0, 0, 0, ceiling.surfaceWidth, baseheight, 0, baseColor, 1);
	surface_reset_target();
	
	// Drawing the front props
	shader_set(shd_fadeColor);
	shader_set_uniform_f_array(ceiling.u_color, color_to_vec3(o_ceiling_draw.baseColor));
	for (var i=ceiling.props.row.count/2;  i<ceiling.props.row.count; i++) {
		for (var j=0; j<array_length(ceiling.props.row.data[i]); j++) {
			var prop = ceiling.props.row.data[i][j];
			shader_set_uniform_f(ceiling.u_pwr, ceiling.props.row.fade[i]);
			draw_sprite_ext(prop.sprite, prop.index, prop.drawX, prop.y, prop.flip, 1, 0, c_front, 1);
		}	
	}
	shader_reset();
	
	// Drawing ceiling
	var _tex = surface_get_texture(surf);
	draw_primitive_begin_texture(pr_trianglestrip, _tex);
	for (var i=0; i<ceiling.unit.count-1; i++) {
		var _point = ceiling.points[i];
		var _y = _point;
		var _xtex = ceiling.texture.xtex[i];
		draw_vertex_texture_color(ceiling.xLow[i], _y, _xtex, 1, c_front, 1);
		draw_vertex_texture_color(ceiling.xLow[i], _y - height, _xtex, 0, c_front, 1);	
	}
	draw_primitive_end();
} else {
	surf = surface_create(ceiling.surfaceWidth, 	height);
}

