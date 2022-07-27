function town_player_setFacing() {
	/*
		Face Point = The direction the player is pushing the character
		Face Move = The direction the character is currently moving in, regardless of point
		Face Draw = The last non-zero movement direction
	*/

	//>> Face Move and Face Draw
	if (abs(move_speed_current) > .3) {
		if (move_speed_current >= 0) face_move = 1 else face_move = -1;
		face_draw = face_move;
	} else {
		face_move = 0;		
	}

	//>> Face Point
	if (abs(ctrl_move_axis) > .5) {
		if (ctrl_move_axis > 0) face_point = 1 else face_point = -1;
	} else face_point = 0;
}


function player_get_imageSpeed_run() {
	var anim_boost = 1 - (move_speed_max - abs(move_speed_current)) / move_speed_max;
	return .5 + (.5 * anim_boost);
}

function town_player_animate() {
	switch(state) {
		case is.Swimming:
		case is.Diving:
			sprite_index = spr_peter_swim;
			var anim_boost = 1 - (move_speed_max_swim - point_distance(0,0,move_speed_current,phy_speed_y) ) / move_speed_max_swim;
			image_speed = .5 + (.5 * anim_boost);
	
			break;
			
		case is.Impacting:
			sprite_index = spr_peter_impact;
			image_speed = 1;
			break;
			
		case is.Standing:
			sprite_index = spr_peter_idle;
			image_speed = 1;
			break;
			
		case is.Walking:
			sprite_index = spr_peter_walk;
			var anim_boost = 1 - (move_speed_max - abs(move_speed_current)) / move_speed_max;
			image_speed = player_get_imageSpeed_run();
			break;
			
		case is.Running:
			sprite_index = spr_peter_run;
			image_speed = player_get_imageSpeed_run();
			break;
			
		case is.Latched:
			sprite_index = spr_peter_latch;
			break;
			
		case is.Jumping:
			test();
			sprite_index = spr_peter_jump;
			break;
			
		case is.Falling:
			if (slip_active) 
				then sprite_index = spr_peter_slipping;
				else sprite_index = spr_peter_fall;
			break;
			
		case is.SpinJumping:
		case is.SpinFalling:
			sprite_index = spr_peter_spinJump;
			image_speed = 1;
			break;
			
		case is.Slipping:
			sprite_index = spr_peter_slipping;
			image_speed = 1;
			break;
			
		case is.Crouching:
			sprite_index = spr_peter_crouch;
			break;
	}
}
