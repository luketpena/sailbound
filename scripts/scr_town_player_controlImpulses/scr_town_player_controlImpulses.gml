function town_player_setControlImpulse() {
	ctrl_move_axis = gamepad_axis_value(0,gp_axislh);
	ctrl_vertical_axis = gamepad_axis_value(0,gp_axislv);

	if gamepad_button_check_pressed(0,gp_face4) ctrl_jump_pulse = .2*room_speed;
	if gamepad_button_check(0,gp_face4) ctrl_jump_hold = true else ctrl_jump_hold = false;


	if (ctrl_down_pulse = -1) {
		if (gamepad_axis_value(0,gp_axislv)>.6) {
			ctrl_down_pulse = 1;
		}
	} else {
		if (gamepad_axis_value(0,gp_axislv)<.2) ctrl_down_pulse = -1;
	}
}

function town_player_resetControlImpulse() {
	ctrl_down_pulse = -1;
	ctrl_jump_pulse = 0;
}
