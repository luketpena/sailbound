function boat_step_controls() {
	//>> Reset button impulses

	if (ctrl_vertical_pulse_timer>0) ctrl_vertical_pulse_timer-- else {
		ctrl_vertical_pulse_timer = -1;
		ctrl_jump_pulse = 0;
		ctrl_dive_pulse = 0;
	}
	if (jump_cool>0) jump_cool--;

	if (autopilot) {
		//Snap to set position
		ctrl_move = clamp((autopilot_x-x_center_draw)/256,-1,1);
	}

	if (abs(gamepad_axis_value(0,gp_axislv))<.4) ctrl_jump_stick_pos = 0;

	if (control_active) {
		//Each control method sets its own impulses off
		switch (control_method) {
				//case "touch": boat_controls_touch(); break;
				//case "tilt": boat_controls_tilt(); break;
				case "gamepad": boat_controls_gamepad(); break;
			}
	}


}
