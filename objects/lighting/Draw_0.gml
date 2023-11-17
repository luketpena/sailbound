if surface_exists(surf) {
	surface_set_target(surf);
		draw_clear_alpha(c_black,1);
		draw_tag("light");
	surface_reset_target();
	texture = surface_get_texture(surf);
} else {
	surf = surface_create(global.vw, global.vh);
}