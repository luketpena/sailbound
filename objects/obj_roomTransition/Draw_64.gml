if surface_exists(surf) {
	surface_set_target(surf);
		draw_sprite_ext(spr_pixel, 0, 0, 0, global.vw, global.vh, 0, c_black, 1);
		draw_circle_color(global.hvw, global.hvh, global.vw * size, c_white, c_white, false);
	surface_reset_target();
	
	shader_set(shd_whiteToTransparent);
		draw_surface_ext(surf, 0, 0, 1, 1, 0, c_white, 1);
	shader_reset();
} else {
	surf = surface_create(global.vw, global.vh);	
}