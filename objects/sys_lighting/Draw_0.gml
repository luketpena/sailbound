if surface_exists(light_surface) {
	surface_set_target(light_surface);
		draw_clear_alpha(c_black,1);
		draw_tag("light");
	surface_reset_target();
	global.light_texture = surface_get_texture(light_surface);
} else {
	light_surface = surface_create(global.vw,global.vh);
}