if (image_alpha > 0) {
	draw_sprite_ext(
		sprite_index,
		image_index,
		x - global.vx, y - global.vy,
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
		);
}