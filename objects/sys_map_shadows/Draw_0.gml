if (surface_exists(surf)) {
	surface_set_target(surf);
		draw_clear_alpha(c_black, 0);
		for (var i=0; i<instance_number(o_map_shadow); i++) {
			var _shadow = instance_find(o_map_shadow, i);
			draw_sprite_ext(
				_shadow.sprite_index,
				_shadow.image_index,
				_shadow.x - o_map_player.x,
				_shadow.y - o_map_player.y,
				_shadow.image_xscale,
				_shadow.image_yscale,
				_shadow.image_angle,
				c_water_depth, alpha
			);
		}
	surface_reset_target();
	
	var _hw = size / 2;
	draw_surface_ext(surf, o_map_player.x - _hw, o_map_player.y - _hw, 1, 1, 0, c_white, .5);
} else {
	surf = surface_create(size, size);	
}