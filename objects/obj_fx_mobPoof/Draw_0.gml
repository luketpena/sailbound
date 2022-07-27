if surface_exists(surf) {
	surface_set_target(surf);
		draw_clear_alpha(c_black, 0);
		draw_sprite_ext(spr_shape_circle_100, 0, 50, 50, scaleOuter, scaleOuter, 0, c_white, 1);
		draw_sprite_ext(spr_shape_circle_100, 0, 50, 50, scaleInner, scaleInner, 0, c_black, 1);
	surface_reset_target();
	
	shader_set(shd_subtract);
		draw_surface_ext(surf, x - 50, y - 50, 1, 1, 0, c_front, 1);
	shader_reset();
} else {
	surf = surface_create(100, 100);
}
