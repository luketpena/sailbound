if (state = "attack") {
	if (attackHit) {
		state = "laugh";
		stateTimer = 2 * room_speed;
		sprite_index = spr_mob_ghost_laugh;
	} else {
		state = "chase";
		sprite_index = spr_mob_ghost_float;
	}
	
}
