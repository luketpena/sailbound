if surface_exists(surf) {
	surface_set_target(surf);
		draw_sprite_ext(s_pixel, 0, 0, 0, global.vw, global.vh, 0, c_black, 1);
		var scale = size * 1.2
		draw_sprite_ext(s_circle_512x512, 0, global.hvw, global.hvh, scale, scale, 0, c_white, 1);
	surface_reset_target();
	
	shader_set(shd_whiteToTransparent);
		draw_surface_ext(surf, 0, 0, 1, 1, 0, c_white, 1);
	shader_reset();
} else {
	surf = surface_create(global.vw, global.vh);	
}