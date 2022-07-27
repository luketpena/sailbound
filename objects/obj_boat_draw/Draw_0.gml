if (draw_active) {
	lighting_flash_draw();
	
	draw_sprite_ext(hullSprite, 1, x, y, 1, 1, hull_angle, c_front, 1);

	draw_sprite_ext(sailSprite,  0,  sail_pos[0],  sail_pos[1],  1,  sail_size_mast,  sail_angle,  c_front, 1);
	
	if (separateSail) {
		draw_sprite_ext(sailSprite,  1,  sail_pos[0],  sail_pos[1],  sail_size_cloth,  sail_size_mast,  sail_angle,  c_front, 1);
	}
	
	if (anim_sprite=-1) {
		draw_sprite_ext(spr_peter_body_idle, 0, x, y, 1, squish, sailor_angle, c_front, 1);
		draw_sprite_ext(spr_peter_head_happy, head_frame, head_pos[0], head_pos[1], 1, squish, 0, c_front, 1);
	} else {
		draw_sprite_ext(anim_sprite, anim_index, x, y, 1, 1, sailor_angle, c_front, 1);	
	}

	draw_sprite_ext(hullSprite, 0, x, y, 1, 1, hull_angle, c_front, 1);
	
	lighting_flash_clear();
}