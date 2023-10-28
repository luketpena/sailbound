if (surface_exists(surf)) {
	surface_set_target(surf)
		draw_clear_alpha(c_black, 0);
		draw_sprite_ext(s_map_compass, 0, 16, 16, 1, 1, image_angle, c_white, 1);
	surface_reset_target();
	
	draw_surface_ext(surf, global.vw - 48, 32 - (16 * image_yscale), 1, image_yscale, 0, c_white, 1);
} else {
	surf = surface_create(32, 32);	
} 