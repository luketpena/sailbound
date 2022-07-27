function player_hMove_ground() {
	player_hMove(.1, .8, move_speed_max, true);	
}

function player_hMove_spinJump() {
	player_hMove(.01, .99, move_speed_max, true);	
}  

function player_hMove_crouch() {
	player_hMove(.1, .6, 0, true);	
}

function player_hMove_water() {
	slip_stability = 1;
	player_hMove(.05, .95, move_speed_max_swim, false);	
}

// Used to find the peak fall speed during any one descent 
// to trigger different effects on impact
function player_findHighestFallSpeed() {
	highestFallSpeed = max(phy_speed_y, highestFallSpeed);	
}

///@description Trigger chain of methods responsible for basic movement
///@param speedUp [.05 to .1] The rate of acceleration
///@param slowDown [.6 to .95] The rate of friction when no accelerating
///@param currentMax [number] The maximum movement speed
///@param accountForSlopes [boolean] Whether or not the movement snaps to slopes
function player_hMove(speedUp, slowDown, currentMax, accountForSlopes) {
	player_calculateHorizontalMovement(speedUp, slowDown, currentMax);
	//>> Horizontal movement calculations and snapping
	//NOTE: .3 is the magic number where the rounding doesn't fuck around. Don't change this.
	if (abs(move_speed_current) > .3) {
		player_setMoveSpeedActive(true);	
		player_applyHorizontalMovement(accountForSlopes);
	}
}

///@description Triggers the actual changes in player move_speed_current
function player_calculateHorizontalMovement(speedUp, slowDown, currentMax) {
	//>> Horizontal movement speed
	if (abs(ctrl_move_axis)>.5) {
		// Speeding up
		move_speed_current += ((currentMax * ctrl_move_axis * slip_stability) - move_speed_current)*speedUp;
	} else {
		// Slowing down
		if (abs(move_speed_current)>.1 && !wallslide_active)
			then move_speed_current *= slowDown;
			else move_speed_current = 0;
		face_point = 0;		
	}
}

///@description Actually finds movement position and snaps to it
///@param accountForSlopes [boolean] Whether or not the movement snaps to slopes
function player_applyHorizontalMovement(accountForSlopes) {
	if (!walled) {
		var max_x = collision_impact_rectangle_h(move_speed_adjusted, -1, top, waist, front, prnt_block, true);
		// Free movement
		max_x -= front_dis;
		phy_position_x = max_x;
	} else {
		var col_side = collision_rectangle(x-h_width+face_move, top, x+h_width+face_move, y, prnt_block, true, true);
		if (!col_side) {
			// Snap to wall
			var max_x = collision_impact_rectangle_h(face_move, -1, top, waist, x+(h_width*face_move), prnt_block, true);
			max_x -= front_dis;
			phy_position_x = max_x;
		}
	}
	// Moving down slopes
	if (accountForSlopes) {
		if (!swim_active && grounded && !walled && slip_overflow <= 0) {
			player_walkDownSlope(max_x)
		}
	}
}

function player_walkDownSlope(target_x) {
	phy_speed_y = 0;
	phy_position_y = collision_impact_rectangle_v(
		h_height,
		-1,
		target_x - h_width,
		target_x + h_width,
		phy_position_y + step_height,
		prnt_block,
		true) - h_height;
}

///@description The adjusted movespeed is the speed that will actually be applied after other factors have been accounted for
///@param calculateSlip Whether or not it will take slipping into account for final move speed
function player_setMoveSpeedActive(calculateSlip) {
	move_speed_adjusted = move_speed_current;
	// Player movement speed is hindered while slipping
	if (calculateSlip) {
		if (grounded && slip_overflow<.5) move_speed_adjusted *= move_speed_adjust;	
	}
}