lighting_flash_draw();
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_front,image_alpha);
lighting_flash_clear();

if (bursting && glow_alpha>0) {
	gpu_set_blendmode(bm_add);
		draw_sprite_ext(spr_fx_chest_glow,0,x+glow_x*image_xscale,y,glow_width*image_xscale,1,0,c_gold,glow_alpha);
	gpu_set_blendmode(bm_normal);	
	glow_alpha -= .05;
}