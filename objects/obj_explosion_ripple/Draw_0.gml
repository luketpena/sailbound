var yy = water_surface_get_y(.5);

draw_sprite_ext(spr_fx_wave, 0, x, yy, -scale*.7, scale*.7, 0, c_water_highlight, image_alpha * .5);
draw_sprite_ext(spr_fx_wave, 0, x, yy, scale, scale, 0, c_water_highlight, image_alpha);

if (burst > 0) {
	burst--;
	//draw_sprite_ext(spr_shape_circle_100, 0, x, yy, .9, .48, 0, c_white, 1);
	gpu_set_blendmode(bm_add);
		draw_sprite_ext(spr_fx_flare_48, 0, x, yy, 2.5, 1, 0, c_orange, 1);
	gpu_set_blendmode(bm_normal);
}