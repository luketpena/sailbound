///@description Central step event for all control-related scripts
function boat_controls_step() {
	
	boat_controls_jumpPulseManagement();
	boat_controls_autopilot();
	
	if (control_active) {
		//Each control method sets its own impulses off
		switch (control_inputType) {
			//case "touch": boat_controls_touch(); break;
			case InputType.mobile: boat_controls_mobile(); break;
			case InputType.gamepad: boat_controls_gamepad(); break;
		}
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
function boat_controls_gamepad() {

	// Movement
	var _deadzone = .2;
	var _tilt = gamepad_axis_value(0,gp_axislh);
	if (abs(_tilt)>_deadzone) {
		autopilot = false;	
		ctrl_move = clamp(_tilt,-1,1)
	} else if (!autopilot) ctrl_move = 0;
	
	// Stick jump lets the player control vertical movement with the control stick
	// This resets the position when brought to neutral, enforcing clicking the stick in a direction to jump rather than just holding
	if (abs(gamepad_axis_value(0,gp_axislv)) < .4) ctrl_jump_stick_pos = 0;

	//>> Jump Press
	var stickJump = (gamepad_axis_value(0,gp_axislv) < -.5 && ctrl_jump_stick_pos != -1);
	if (gamepad_button_check_pressed(0,gp_face4) || gamepad_button_check_pressed(0,gp_shoulderl) || stickJump) {
		boat_controls_triggerJump();
	}

	// Dive Release
	var stickDive = (gamepad_axis_value(0,gp_axislv) > .5 && ctrl_jump_stick_pos != 1);
	if (gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(0,gp_shoulderlb) || stickDive) {
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
