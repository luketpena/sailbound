///@description Sense if a block is below the feet of the player
function town_player_senseGrounded() {
	grounded = collision_rectangle(left, bottom, right, bottom+4, prnt_block, true, true);
	//Collision down of left and right sides
	col_left = collision_impact_rectangle_v(32, -1, left, x, bottom, prnt_block, true);
	col_right = collision_impact_rectangle_v(32, -1, right, x, bottom, prnt_block, true);
	//Get the angle of the left and right collisions
	var xl = x-h_width/2;
	var xr = x+h_width/2;
	col_angle = point_direction(xr, col_right, xl, col_left);
}

///@description Sense if a wall is impeding movement
function town_player_senseWalled() {
	walled = !!collision_rectangle(left-1+move_speed_adjusted, top, right+1+move_speed_adjusted, top+4, prnt_block, true, true);
}

///@description Sense if a wall is in front of the full height of the point direction of the player
function town_player_senseFaced() {
	faced = !!collision_rectangle(left + face_point, top+1, right + face_point, bottom-1, prnt_block, true, true);	
}

///@description sense if a player is submerged enough to be considered "in the water"
function town_player_senseWatered() {
	watered = collision_rectangle(left, y, right, y+4, obj_block_water, false, true);
}

function town_player_senseSlipping() {
	//  Setup
	slip_current = (col_angle-180) / 45;
	slip_overflow = max(abs(slip_current)-1, 0);
	move_speed_adjust = 1 - abs(slip_current / 3);
	
	var nearSlipBlock = false;
	if (instance_exists(obj_block_slip)) {
		var slipBlock = instance_nearest(x, y, obj_block_slip);
		nearSlipBlock = point_distance(
			x, y,
			slipBlock.x, slipBlock.y
		) < 20;
	}
	
	// Slipping
	if ((slip_overflow > 0 || nearSlipBlock) && grounded) {
		slip_stability *= .8;
	} else {
		if (slip_stability < 1) slip_stability += .05;	
	}
	
	// Slip effects
	if (slip_stability < 1) {
		physics_apply_force(x, y, 0, 30 * (1 - slip_stability));
		if (abs(slip_overflow) <= 0) {
			if (phy_speed > 1) {
				phy_speed_x *= .9;
				phy_speed_y *= .9;
			}
		}
	} else if (xspeed_lock) {
		phy_speed_x = 0;
	}
}
