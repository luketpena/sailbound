for (var i=0; i<puffNum; i++) {
	var puff = puff_list[i];
	draw_sprite_ext(spr_fx_particle_swirl, 10 * (1-puff.alpha), puff.x, puff.y, puff.flip, 1, puff.angle, puff.color, puff.alpha);
}

if (image_speed) draw_sprite_ext(spr_fx_explosion, image_index, x, y, 1, 1, image_angle, c_white, 1);

if (circle_active) {
	circle_active--;
	circle_radius += 2
	var scale = circle_radius * .02;
	draw_sprite_ext(spr_shape_circle_100, 0, x, y, scale, scale, 0, c_white, 1);
	gpu_set_blendmode(bm_add);
		draw_sprite_ext(spr_fx_flare_300, 0, x, y, 1, 1, 0, c_orange, .5);
	gpu_set_blendmode(bm_normal);
}