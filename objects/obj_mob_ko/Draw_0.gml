if (sprite_index) {
	lighting_flash_draw();
	draw_sprite_ext(sprite_index,image_index,x,y,flip*image_xscale,image_yscale,image_angle,image_blend,1);
}