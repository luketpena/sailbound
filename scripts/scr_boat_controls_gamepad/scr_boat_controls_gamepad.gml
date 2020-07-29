function boat_controls_gamepad() {

	//>> Movement
	var _deadzone = .2;
	var _tilt = gamepad_axis_value(0,gp_axislh);
	if (abs(_tilt)>_deadzone) {
		autopilot = false;	
		ctrl_move = clamp(_tilt,-1,1)
	} else if (!autopilot) ctrl_move = 0;

	//>> Jump Press
	var stickJump = (gamepad_axis_value(0,gp_axislv)<-.5 && ctrl_jump_stick_pos!=-1);
	if (gamepad_button_check_pressed(0,gp_face4) || gamepad_button_check_pressed(0,gp_shoulderl) || stickJump) {
		if (jump_cool=0) {
			ctrl_jump_pulse = 1;
			ctrl_vertical_pulse_timer = .1*room_speed;
			jump_cool = .2*room_speed;
			ctrl_jump_stick_pos = -1;
		}
	}

	//>> Dive Release
	var stickDive = (gamepad_axis_value(0,gp_axislv)>.5 && ctrl_jump_stick_pos!=1);
	if (gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(0,gp_shoulderlb) || stickDive) {
		if (jump_cool = 0) {
			ctrl_dive_pulse = 1;
			ctrl_vertical_pulse_timer = .1*room_speed;
			jump_cool = .2*room_speed;
			ctrl_jump_stick_pos = 1;
		} else ctrl_dive_pulse = 2;
	}
}
