draw_set_alpha(1);
draw_set_color(c_white);

gpu_set_blendmode(bm_add);
	draw_self();
	draw_sprite_ext(spr_fx_flare_128_9slice, 0, x - 32, y - 32, glowXscale, glowYScale, 0, c_fire, 1);
gpu_set_blendmode(bm_normal);