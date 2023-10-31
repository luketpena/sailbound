function player_step_crouch() {
	if (ctrl_vertical_axis > .5 && grounded) {
		crouch_active = true;	
	} else {
		crouch_active = false;
	}
}

function player_moveSpeed_set(speed) {
	move_speed_current = speed;	
}

function player_moveSpeed_stop() {
	player_moveSpeed_set(0);	
}

function player_fallthru_step() {
	if (fallthru_cooldown > 0) fallthru_cooldown-- else {
		if (fallthru_active) {
			if (ctrl_vertical_axis < .5) {
				fallthru_active = false;
			}
		}
	}
}

function player_fallthru_trigger() {
	if (ctrl_jump_pulse || fallthru_charge = fallthru_charge_target) {
		fallthru_active = true;
		fallthru_cooldown = 10;
		groundSnapCooldown = 5;
	} else if (fallthru_charge < fallthru_charge_target && input.town.crouch.held) fallthru_charge++;
}

function player_senseLadder() {
	// Cooldown
	if (ladder_timeout > 0) ladder_timeout--;
	
	// Collision
	ladder_touch = collision_rectangle(left, top, right, y - (h_height * .5), o_ladder, false, true);
	
	if (ladder_timeout = 0 && ladder_touch && abs(ctrl_vertical_axis) > .8) {
		phy_speed_stop();
		ladder_x = ladder_touch.x + 16;
		phy_position_x = ladder_x;
		move_speed_current = 0;
		state = is.Climbing;
	}

}

function player_climbLadder() {
	if (ladder_timeout > 0) ladder_timeout--;
	
	if (ctrl_jump_pulse > 0) {
		player_jump_standard();	
		ladder_timeout = ladder_timeout_set;
	} else {
		// Climbing
		phy_position_x = ladder_x;
		phy_speed_y = 0;
		var movingUp = ctrl_vertical_axis < -.25;
		var movingDown = ctrl_vertical_axis > .25;
		ladder_touch = collision_rectangle(left, top, right, y, o_ladder, false, true);
		if (ladder_touch) {
			ladder_saved = ladder_touch;	
		} else {
			if (movingUp) {
				phy_position_y = ladder_saved.y - h_height;
				player_jump(-3, false)
			} else {
				player_setState(is.Falling);
			}
		}
		
		
				
		if (movingDown || movingUp) {
			var targetSpeed = movingDown ? ladder_maxSpeed : -ladder_maxSpeed;
			ladder_speed += (targetSpeed - ladder_speed) * .2;	
			if (grounded && movingDown) {
				player_setState(is.Standing);
				player_impactGround();
				ladder_timeout = ladder_timeout_set;
			}
		} else {
			ladder_speed *= .85;	
		}
		
		phy_position_y += ladder_speed;
	}
}

function player_step_rope() {
	var rope_touch = collision_rectangle(left, top, right, bottom, obj_rope, false, true);
	
	if (!rope_active) {
		rope_target = noone;
		if (rope_touch && gamepad_button_check(0, gp_face1)) {
			rope_active = true;
			rope_target = rope_touch.root;
			rope_touch.grab();
			phy_speed_x = 0;
			phy_speed_y = 0;
		}
	} else {
		if (rope_target && instance_exists(rope_target)) {
			phy_position_x = rope_target.grab_x;
			phy_position_y = rope_target.grab_y;
			
			if (abs(ctrl_vertical_axis) > .25) {
				rope_target.grab_position = clamp(rope_target.grab_position + 1*ctrl_vertical_axis, 0, rope_target.grab_length);
			}
			
			if (abs(ctrl_move_axis) > .25) {
				var rope = rope_target.getActiveRope();
				rope.push(5*ctrl_move_axis);
			}
		}
	}
}

function player_snapToGround() {
	var max_y = collision_impact_rectangle_v(32,-1,x-h_width,x+h_width,y+step_height,prnt_block,true);
	phy_position_y = ceil(max_y-h_height)+1;	
	phy_speed_y = 0;
	draw_y = y;
}

///@description Stop movement speed when a wall is in front of the player at any points
function player_stopWhenFaced() {
	if (faced) {
		move_speed_current = 0;
		phy_speed_x = 0;
	}
}

function player_snapToWall() {
	if (walled && face_point != 0) {
		var wall_x = collision_impact_rectangle_h(16 * face_point, -1, top, bottom, front, prnt_block, true);
		var target_x = wall_x - ((h_width+1) * face_point);	
		
		if (abs(target_x - phy_position_x) > 1) {
			phy_position_x = target_x;
		}
	}
}

function player_snapToGroundWhileStanding() {
	if (groundSnapCooldown > 0) groundSnapCooldown-- else {
		var speedCheck = phy_speed_y > -1,
			slipCheck = slip_stability > .5;
		if (speedCheck && slipCheck) player_snapToGround();
	}
}

function player_shortHop() {
	if (!ctrl_jump_hold && phy_speed_y < -1) phy_speed_y *= .9;
}

function player_impactGround() {
	
	player_snapToGround();
	slip_active = false;

	// Snap y position and start animation
	if (highestFallSpeed > 5) image_index = 0
	else if (highestFallSpeed > 2) image_index = 1;
	else image_index = 2;
	
	player_setState(is.Impacting);
	var col = collision_impact(270, 16, -1, draw_x, draw_y, prnt_block, true);
	dust_create_land(draw_x, col[1]);
	phy_speed_x = 0;
	move_speed_current = 0;	
}

function player_setState(newState) {
	state = newState;
}

function player_findLatch() {
	latch_target = collision_rectangle(left, top, right, bottom, obj_latch, false, true);
	if (latch_target && latch_timeout = 0) {
		var latchIsBelow = (latch_target.y < top+1);
		var latchIsInFront = ((latch_target.x - x) * face_move > 0);
		
		if ( latchIsBelow && latchIsInFront ) {
			player_setState(is.Latched);
			phy_speed_y = 0;
			phy_speed_x = 0;
			move_speed_current = 0;
			return true;
		}
	}
	return false;
}

function player_holdLatch() {
	phy_position_y = latch_target.y+h_height;
	phy_position_x = latch_target.x-(h_width*face_draw);
	//>> Releasing the latch
	if (ctrl_down_pulse > .9) {	
		player_setState(is.Falling);
		latch_timeout = .5*room_speed;
		face_move = 0;
	}
}


function player_applyGravity(force) {
	physics_apply_force(x, y, 0, force);
}

function player_findWallslide() {
	// If movement speed and point direction are the same
	if (face_point != 0 && face_move = face_point && walled) {
		if (phy_speed_y > wallslide_triggerSpeed) {
			var space = player_findWallSpace();
			if (space.top != noone && space.bottom != noone) {
				player_setState(is.Sliding);
				player_snapToWall();
				phy_speed_x = 0;
				move_speed_current = 0;
			}
		}	
	}	
	
}

function player_findWallSpace(rangeH = 8, rangeV = 8) {
	var frontExtended = front_last + (rangeH * face_draw),
		spaceAtTop = collision_rectangle(front_last, top, frontExtended, top - rangeV, prnt_block, true, true),
		spaceAtBottom = collision_rectangle(front_last, bottom, frontExtended, bottom + rangeV, prnt_block, true, true);
		
	return {
		top: spaceAtTop,
		bottom: spaceAtBottom,
	}
}

function player_wallSlide() {
	phy_speed_x = 0;
	if (phy_speed_y > wallslide_triggerSpeed) {
		phy_speed_y *= .7;
	}
	wallslide_hold = wallslide_hold_set;
	var space = player_findWallSpace();
	if (!walled || face_point = 0 || space.top = null || space.bottom = null) {
		player_setState(is.Falling);	
	}
}

function player_jump_wallSlide() {
	var dis = 8 * face_point,
		wallInRange = !!collision_rectangle(left + dis, top+1, right + dis, bottom-1, prnt_block, true, true);	
	
	if (wallslide_hold > 0 || wallInRange) {
		wallslide_hold--;
		var dir = 1;
		if (wallInRange) dir = -1;
		player_jump_wall(dir);
	}
}

function player_jump(vspeed, fromGround = true) {
	player_setState(is.Jumping);
	phy_speed_y = vspeed;	
	player_jump_settings();
	if (fromGround) {
		dust_create_jump(draw_x, draw_y + 12);
	}
}

function player_spinJump(vspeed, hspeed) {
	player_setState(is.SpinJumping);
	phy_speed_y = vspeed;
	move_speed_current = hspeed;
	player_jump_settings();
}

function player_jump_settings() {
	slip_active = false;
	slip_stability = 1
	ctrl_jump_pulse = 0;
	highestFallSpeed = 0;	
	coyote_time = 0;
}

function player_jump_standard() {
	if (ctrl_jump_pulse > 0) player_jump(-5);	
}

function player_jump_short() {
	if (ctrl_jump_pulse > 0) player_jump(-4);	
}

// Allows the player to jump nearby ground while slipping
function player_jump_slip() {
	if (slip_active && phy_speed_y < 4) {
		var qHeight = h_height*.5,
			foundJumpSurface = collision_circle(x, y + qHeight, qHeight + 8, prnt_block, false, true);
		
		if (foundJumpSurface) {
			player_jump_short();	
		}
	}
}

function player_jump_wall(flip) {
	if (ctrl_jump_pulse > 0) {
		wallslide_hold = 0;
		player_spinJump(-5, move_speed_max * face_draw * flip);	
	}
}


function player_senseState_falling() {
	if (!grounded) {
		highestFallSpeed = 0;
		if (phy_speed_y < 0)
			then player_setState(is.Jumping);	
			else player_setState(is.Falling);	
	}
}

function player_senseState_movement() {
	if (grounded) {
		if (ctrl_vertical_axis > .5) {
			state = is.Crouching;
			dust.reset();
		} else {
			var abs_speed = abs(move_speed_current);
		
			if (abs_speed < 1 || walled) {
				if (slip_active) {
					state = is.Slipping;	
				} state = is.Standing; 
				dust.reset();
			} else {
				if (abs_speed>move_speed_max*.75) state = is.Running
				else state = is.Walking
			}
		}
	}
}

function player_senseState_slipping() {
	if (grounded) {
		if (slip_stability < .5) {
			player_setState(is.Slipping);	
			slip_active = true;
		} else slip_active = false;
	}
}

function player_senseState_crouching() {
	if (ctrl_vertical_axis > .5) {
		player_setState(is.Crouching);
		return true;
	}
	return false;
}

function player_coyoteTime() {
	if (coyote_time > 0) {
		player_jump_standard();
		coyote_time--;
	}
}

function player_senseState_swimming() {
	if (watered) {
		phy_speed_y /= 4;
		player_setState(is.Swimming);
	}
}

function player_senseState_swimmingEnd() {
	if (!watered) {
		state = is.Falling;	
	}
}

//function player_determineState() {
//	if (grounded) {
//		if (swim_active) {
//			state = is.Diving;
//		} else if (abs(phy_speed_x) > 0 && phy_speed_y > 0) {
//			state = is.Slipping;
//		} else {
//			if (walled) {
//				state = is.Standing;	
//			} else {
//				var abs_speed = abs(move_speed_current);
//				if (abs_speed>move_speed_max*.75) state = is.Running
//				else if (abs_speed>1) state = is.Walking
//				else if (ctrl_vertical_axis > .5) state = is.Crouching
//				else state = is.Standing;
//			}
//		}
//	} else {
//		if (swim_active) {
//			if (dive_active) then state = is.Diving else state = is.Swimming;
//		} else {
//			if (latch_active) state = is.Latched;
//			else if (glide_active) state = is.Gliding;
//			else if (ladder_active) state = is.Climbing;
//			else if (wallslide_active) state = is.Sliding;
//			else if (rope_active) state = is.Swinging;
//			else if (phy_speed_y < 0) state = is.Jumping
//			else state = is.Falling;
//		}
//	}
//}