function town_player_setControlImpulse() {
	// Check for gamepad input
	ctrl_move_axis = input.sail.move_h.value;
	ctrl_vertical_axis = input.sail.move_v.value;
	
	//// If not out of deadzone, snap to 0
	//if (abs(ctrl_move_axis) < global.deadzone) ctrl_move_axis = 0;
	//if (abs(ctrl_vertical_axis) < global.deadzone) ctrl_vertical_axis = 0;
	
	//// If at zero, allow for checking for keyboard input
	//if (ctrl_move_axis = 0) {
	//	ctrl_move_axis = input_check("left") ? -1 : (input_check("right") ? 1 : 0);
	//}
	
	//if (ctrl_vertical_axis = 0) {
	//	ctrl_vertical_axis = input_check("up") ? -1 : (input_check("down") ? 1 : 0);
	//}
	
	if (!input.town.crouch.held) {
		fallthru_charge = 0;	
	}
	
	if (input.town.jump.pressed) ctrl_jump_pulse = seconds(.2);
	ctrl_jump_hold = input.town.jump.held;
}

