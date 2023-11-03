if (surface_exists(surf)) {
	var _moveOffset = ground.getTextureOffset();
	// Draw the surface texture
	surface_set_target(surf);
		draw_sprite_tiled_ext(edgeSprite, 0, ground.texture.offset - ground.offset, height, 1, 1, c_white, 1);
		draw_sprite_ext(s_pixel, 0, 0, 0, ground.surfaceWidth, baseheight, 0, baseColor, 1);
	surface_reset_target();
	
	// Drawing ceiling
	var _tex = surface_get_texture(surf);
	draw_primitive_begin_texture(pr_trianglestrip, _tex);
	for (var i=0; i<ground.unit.count-1; i++) {
		var _point = ground.points[i];
		var _y = _point + 16;
		var _xtex = ground.texture.xtex[i];
		draw_vertex_texture_color(ground.xLow[i], _y, _xtex, 1, c_front, 1);
		draw_vertex_texture_color(ground.xLow[i], _y - height, _xtex, 0, c_front, 1);	
	}
	draw_primitive_end();
} else {
	surf = surface_create(ground.surfaceWidth, 	height);
}

