if (!surface_exists(surf)) {
	surf = surface_create(surfaceLength, 16);	
} else {
	surface_set_target(surf);
		draw_clear_alpha(c_white, 0);
		draw_sprite_tiled_ext(spr_boat_wake, 0, -surfaceOffset, 0, 1, 1, c_white, 1);
	surface_reset_target();
}

for (var i=0; i<array_length(segmentList); i++) {
	if (i > 0) {
		var s1 = segmentList[i];
		var s2 = segmentList[i-1];
		//draw_sprite_ext(spr_line, 0, s1.x, s1.y, 1, s1.width / 4, s1.angle, c_white, s1.alpha);
		var tex = surface_get_texture(surf);
		draw_primitive_begin_texture(pr_trianglestrip, tex);
			// Back left
			draw_vertex_texture_color(
				s2.x + lengthdir_x(s2.width, s2.angle),
				s2.y + lengthdir_y(s2.width, s2.angle),
				unit * (i-1), 0, color, s2.alpha);
				
			// Back right
			draw_vertex_texture_color(
				s2.x + lengthdir_x(-s2.width, s2.angle),
				s2.y + lengthdir_y(-s2.width, s2.angle),
				unit * (i-1), 1, color, s2.alpha);
				
			// Front left
			draw_vertex_texture_color(
				s1.x + lengthdir_x(s1.width, s1.angle),
				s1.y + lengthdir_y(s1.width, s1.angle),
				unit * i, 0, color, s1.alpha);
				
			// Front right
			draw_vertex_texture_color(
				s1.x + lengthdir_x(-s1.width, s1.angle),
				s1.y + lengthdir_y(-s1.width, s1.angle),
				unit * i, 1, color, s1.alpha);
				
		draw_primitive_end();
	}
}