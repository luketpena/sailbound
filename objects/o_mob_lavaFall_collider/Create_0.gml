image_yscale = height / 16;	
fixture_create_box(id, 8, sprite_height / 2, .1, 0, 0, 0, 0, true, true);

glowXscale = (sprite_width + 64) / 117;
glowYScale = (sprite_height + 64) / 117;

light = light_create(0, 0, spr_fx_flare_128_9slice, 0, glowXscale, glowYScale, c_fire, 1);