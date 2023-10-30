if (inRange) {
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_front, 1);
	var scale = light.image_alpha / .8;
	draw_sprite_ext(s_fx_flame_tiny, fireAnim, x, y-61, scale, scale, 0, c_yellow, 1);

	if (light.image_alpha > 0) {
		gpu_set_blendmode(bm_add);
			draw_sprite_ext(spr_fx_flare_300, 0, x, y-64, 1, 1, 0, c_fire, .5 * light.image_alpha);
			draw_sprite_ext(spr_fx_flare_300, 0, x, y-65, .1, .1, 0, c_fire, light.image_alpha);
			
			draw_set_alpha(.05 * light.image_alpha);
			draw_circle_color(x-1, y-65, aura.getRad(), c_fire, c_fire, false);
		gpu_set_blendmode(bm_normal);	
	}
}