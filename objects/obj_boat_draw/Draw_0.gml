if (draw_active) {
	lighting_flash_draw();

		draw_sprite_ext(spr_boat_hull,1,x,y,1,1,hull_angle,global.c_front,1);

		draw_sprite_ext(spr_boat_sail, 0, sail_pos[0], sail_pos[1], 1, sail_size_mast, sail_angle, global.c_front,1);
		draw_sprite_ext(spr_boat_sail, 1, sail_pos[0], sail_pos[1], sail_size_cloth, sail_size_mast, sail_angle, global.c_front,1);
	
		if (anim_sprite=-1) {
			draw_sprite_ext(spr_peter_body_idle,0,x,y,1,squish,sailor_angle,global.c_front,1);
			draw_sprite_ext(spr_peter_head_happy,head_frame,head_pos[0],head_pos[1],1,squish,0,global.c_front,1);
		} else {
			draw_sprite_ext(anim_sprite,anim_index,x,y,1,1,sailor_angle,global.c_front,1);	
		}

	draw_sprite_ext(spr_boat_hull,0,x,y,1,1,hull_angle,global.c_front,1);
}