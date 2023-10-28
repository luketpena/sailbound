if surface_exists(surf) {
	draw_set_alpha(1);
	draw_set_color(c_white);
	surface_set_target(surf);
		draw_sprite_ext(s_pixel, 0, 0, 0, global.vw, global.vh, 0, c_black, 1);
		// TODO: draw_circle only not working in town, either investigate or just go with the sprite cutout
		// draw_circle_color(global.hvw, global.hvh, global.vw * size, c_white, c_white, false);
		var scale = size * 1.2
		draw_sprite_ext(s_circle_512x512, 0, global.hvw, global.hvh, scale, scale, 0, c_white, 1);
	surface_reset_target();
	
	shader_set(shd_whiteToTransparent);
		draw_surface_ext(surf, 0, 0, 1, 1, 0, c_white, 1);
	shader_reset();
} else {
	surf = surface_create(global.vw, global.vh);	
}