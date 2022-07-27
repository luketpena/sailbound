//---- Size and Positioning ----\\
left = x - h_width;
right = x + h_width;
top = y - h_height;
bottom = y + h_height;
front_dis = h_width * face_move;
front = x + front_dis;
waist = y + step_height;

if (latch_timeout>0) latch_timeout--;

//---- Running ----\\
town_player_setControlImpulse();

prnt_interactable.active = false;
var closestInteractable = instance_nearest(x + (16 * face_draw), y, prnt_interactable);
if (distance_to_object(closestInteractable) < 16) {
	closestInteractable.active = true;	
}

town_player_senseGrounded();
town_player_senseWalled();
town_player_senseFaced();
town_player_senseWatered();
town_player_animate();


if (grounded) {
	coyote_time = coyote_set;
}

switch(state) {
	
	case is.Jumping:
		player_hMove_ground();
		player_shortHop();
		player_applyGravity(60);
		player_fallthru_step();
		player_jump_wallSlide();
		player_senseLadder();
		
		if (phy_speed_y >= 0) {
			highestFallSpeed = 0;
			player_setState(is.Falling);
		}
		
		break;
		
	case is.Falling:
		player_jump_slip();
		player_jump_wallSlide();
		player_hMove_ground();
		player_coyoteTime();
		
		player_findLatch();
		player_findWallslide();	
		player_senseLadder();
		
		player_senseState_swimming();
		
		player_applyGravity(60);
		player_fallthru_step();
		
		if (grounded) player_impactGround();
		break;
		
	case is.SpinJumping:
		player_hMove_spinJump();
		player_shortHop()
		player_applyGravity(60);
		player_fallthru_step();
		player_senseLadder();
		
		
		if (walled) player_jump_wall(-1);
		
		if (phy_speed_y >= 0) {
			highestFallSpeed = 0;
			player_setState(is.SpinFalling);
		}
		break;
		
	case is.SpinFalling:
		player_hMove_spinJump();
		if (walled) player_jump_wall(-1);
		
		player_findLatch();
		player_findWallslide();	
		player_findHighestFallSpeed();
		player_senseLadder();
		
		player_applyGravity(60);
		player_fallthru_step();
		player_senseState_swimming();
		
		if (grounded) player_impactGround();
		break;
		
	case is.Standing:
		player_hMove_ground();
		player_jump_standard();
		player_senseState_falling();
		player_senseState_slipping();
		player_senseState_movement();
		player_snapToGroundWhileStanding();
		town_player_senseSlipping();
		player_senseLadder();
		break;
		
	case is.Slipping:
		player_hMove_ground();
		player_jump_slip();
		player_senseState_falling();
		player_senseState_movement();
		town_player_senseSlipping();
		break;
		
	case is.Impacting:
		if (image_index > 1) player_hMove_ground();
		player_jump_standard();
		player_senseState_crouching();
		player_snapToGroundWhileStanding();
		town_player_senseSlipping();
		break;
		
	case is.Walking:
	case is.Running:
		player_hMove_ground();
		player_jump_standard();
		player_senseState_falling();
		player_senseState_movement();
		town_player_senseSlipping();
		player_senseLadder();
		break;
		
	case is.Latched:
		player_holdLatch();
		player_jump_short();
		break;
		
	case is.Sliding:
		player_wallSlide();
		player_applyGravity(20);
		player_snapToWall();
		player_jump_wall(-1);
		break;
		
	case is.Swimming:
		player_swimming();
		player_hMove_water();
		player_stopWhenFaced();
		player_jump_short();
		player_senseState_swimmingEnd();
		player_senseLadder();
		break;
		
	case is.Diving:
		player_diving();
		player_hMove_water();
		player_stopWhenFaced();
		player_senseState_swimmingEnd();
		break;
		
	case is.Crouching:
		player_snapToGroundWhileStanding();
		player_hMove_crouch();
		player_senseState_movement();
		player_fallthru_trigger();
		player_senseState_falling();
		town_player_senseSlipping();
		break;
		
	case is.Climbing:
		player_climbLadder();
		break;
}

town_player_setFacing();


town_player_resetControlImpulse();