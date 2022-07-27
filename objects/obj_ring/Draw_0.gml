var sideX = x + openAnim + lerp(-32, 32, slide);
var edgeX = x + openAnim + lerp(-16, 16, slide);

if (flash > 0) {
	gpu_set_blendmode(bm_add);
		draw_sprite_ext(
			spr_fx_flare_300,
			0,
			x,
			y,
			.3 + abs(lerp(-.2, .2, slide)),
			.5,
			0,
			c_gold,
			flash
		);
	gpu_set_blendmode(bm_normal);
}

lighting_flash_draw();
draw_sprite_ext(spr_ring_side, 0, sideX + offset * face, y, image_xscale, 1, 0, c_white, image_alpha);

draw_sprite_pos(spr_ring_front, 0,
	edgeX + offset, topY,
	edgeX - offset, topY,
	sideX - offset, y,
	sideX + offset, y,
	image_alpha);
	
draw_sprite_pos(spr_ring_front, 1,
	edgeX + offset, bottomY,
	edgeX - offset, bottomY,
	sideX - offset, y,
	sideX + offset, y,
	image_alpha);
lighting_flash_clear();