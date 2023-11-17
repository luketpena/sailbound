draw_set_color(c_white);
draw_set_alpha(1);

if (surface_exists(surf_detail) && surface_exists(surf_transfer)) {
	var _moveOffset = getTextureOffset();
	// We draw the detail surfaces offset by a value...
	surface_set_target(surf_transfer);
		draw_clear_alpha(c_white, 0);
		draw_surface_ext(surf_detail, -_moveOffset, 0, 1, 1, 0, c_white, 1);
	surface_reset_target();
	
	// ...then transfer it to the main detail layer at position 0, simulating motion
	surface_set_target(surf_detail);
		draw_clear_alpha(c_white, 0);
		draw_surface_ext(surf_transfer, 0, 0, 1, 1, 0, c_white, 1);
		createNewStone();
	surface_reset_target();
} else {
	surf_detail = surface_create(surfaceWidth, 64);
	surf_transfer = surface_create(surfaceWidth, 64);
}

// Creating the actual ground texture
if surface_exists(surf) {
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
		// Tiled sprite
		draw_sprite_tiled_ext(groundSprite, 0, texture.offset - offset, 0, 1, 1, c_front, 1);
		// The detail surface
		draw_surface_ext(surf_detail, -offset, 0, 1, 1, 0, c_front, 1);
		// Fade to water depth on vertical edges
		draw_sprite_ext(spr_ground_fade, 0, 0, 0, surfaceWidth, 1, 0, c_water_depth, 1);
	surface_reset_target();	
	shader_set(shd_maxAlpha);
	
	var _tex = surface_get_texture(surf);
	// Drawing the back half
	// Left side
	draw_primitive_begin_texture(pr_trianglestrip, _tex);
	for (var i=0; i<=unit.midCount; i++) {
		var point = points[i];
		draw_vertex_texture(xTop[i], point-32, texture.xtex[i], 0);
		draw_vertex_texture(xMid[i], point, texture.xtex[i], .5);
	}
	draw_primitive_end();
	
	// Right side
	draw_primitive_begin_texture(pr_trianglestrip, _tex);
	for (var i=unit.count-2; i>=unit.midCount; i--) {
		var point = points[i];
		draw_vertex_texture(xMid[i], point, texture.xtex[i], .5);
		draw_vertex_texture(xTop[i], point-32, texture.xtex[i], 0);
	}
	draw_primitive_end();
	
	shader_reset();
} else {
	surf = surface_create(surfaceWidth, 64);	
}

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


