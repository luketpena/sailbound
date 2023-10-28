///@description Central step event for all control-related scripts
function boat_controls_step() {
	
	boat_controls_jumpPulseManagement();
	boat_controls_autopilot();
	
	if (global.input_active) {
		ctrl_move = 0;
		// Movement
		boat_input_move_gamepad();
	}
}

function boat_distanceToSurface() {
	distanceToSurface = abs(global.boat_y - waterY_center);
	
	// Flags whether the boat is in range to switch between jumping and diving
	ctrl_jumpDive_inRange = (distanceToSurface < ctrl_jumpDive_range);
}

///@description Controls the jump / dive pulse forgiveness for timing jumps with contact with water
function boat_controls_jumpPulseManagement() {
	if (ctrl_vertical_pulse_timer > 0) ctrl_vertical_pulse_timer-- else {
		ctrl_vertical_pulse_timer = -1;
		ctrl_jump_pulse = 0;
		ctrl_dive_pulse = 0;
	}
	if (jump_cool > 0) jump_cool--;	
}

///@description Autopilot takes control of the player's controls, moving them to a specific position on the water
function boat_controls_autopilot() {
	if (autopilot) {
		ctrl_move = clamp((autopilot_x-x_center_draw) / 256, -1, 1);
	}	
}

///@description Detects inputs from a gamepad and translates them into movement
function boat_input_move_gamepad() {
	// Movement
	var _tilt = input.sail.move_h.value;
	if (abs(_tilt) > 0) {
		autopilot = false;	
		ctrl_move = clamp(_tilt,-1,1)
	} else if (!autopilot) ctrl_move = 0;
	

	// Jump
	if (input.sail.move_v.clickNegative) {
		boat_controls_triggerJump();
	}

	// Dive
	if (input.sail.move_v.clickPositive) {
		boat_controls_triggerDive();
	}
	
}

function boat_controls_mobile() {
	switch(control_mobileMovement) {
		case MobileMovement.tilt: boat_controls_tilt(); break;	
	}
	
	var fingerIndex = touch.zone_swipe(zone_jump);
	if (fingerIndex != noone) {
		var _finger = touch.finger(fingerIndex);
		if (angleInRange(_finger.swipe_dir, 90, 20)) {
			boat_controls_triggerJump();
		} else if (angleInRange(_finger.swipe_dir, 270, 20)) {
			boat_controls_triggerDive();	
		}
	}
}

function boat_controls_triggerJump() {
	if (jump_cool = 0) {
		ctrl_jump_pulse = 1;
		ctrl_dive_pulse = 0;
		ctrl_vertical_pulse_timer = .2*room_speed;
		jump_cool = .5*room_speed;
		ctrl_jump_stick_pos = -1;
	}	
}

function boat_controls_triggerDive() {
	if (jump_cool = 0) {
		ctrl_dive_pulse = 1;
		ctrl_jump_pulse = 0;
		ctrl_vertical_pulse_timer = .2*room_speed;
		jump_cool = .5*room_speed;
		ctrl_jump_stick_pos = 1;
	}
}

///@description Detects input from a touch screen set to tilt controls
function boat_controls_tilt() {
	ctrl_move = controls.tilt_current;
}
