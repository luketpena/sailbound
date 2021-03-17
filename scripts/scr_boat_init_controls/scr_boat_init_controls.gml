function boat_init_controls() {
	var inputType, mobileMovement;
	switch(system.osType) {
		case OsType.Desktop:
			inputType = InputType.gamepad;
			mobileMovement = null;
			break;
		
		case OsType.Mobile:
			inputType = InputType.mobile;
			mobileMovement = MobileMovement.tilt;
			break;
	}
	control_active = true;
	control_inputType = inputType
	control_mobileMovement = mobileMovement;
	ctrl_move = 0; //-1=left; 1=right;
	ctrl_jump_stick_pos = 0;
	ctrl_jump_pulse = 0;
	ctrl_jumpDive_inRange = false; // Flag for being ready to jump or dive
	ctrl_jumpDive_range = 32; // Range of inRange flag
	ctrl_dive_pulse = 0;
	ctrl_vertical_pulse_timer = -1;
	zone_jump = zone_create(global.hvw, 0, global.vw, global.vh);
}
