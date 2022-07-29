if (surface_exists(surf)) {
	draw_surface_ext(surf, x, y, 1, 1, 0, c_front, 1);
} else {
	var height = image_yscale * 64;
	surf = surface_create(32, height);
	surface_set_target(surf);
		draw_clear_alpha(c_white, 0);
		draw_sprite_tiled_ext(
			sprite_index, 0,
			0, 0, 1, 1, c_white, 1
		);
	surface_reset_target();
}