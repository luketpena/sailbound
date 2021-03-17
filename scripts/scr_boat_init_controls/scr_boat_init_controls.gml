function boat_init_controls(
	inputType,
	mobileMovement
) {
	/*
		Defines everything relating to controls on the boat.
	*/

	control_active = true;
	control_inputType = inputType
	control_mobileMovement = mobileMovement;
	ctrl_move_active = 0;

	ctrl_move_stop = true; //Prevents x movement when active
	ctrl_move_x = 128;
	ctrl_move_y = global.vh-72;
	//ctrl_key_move = virtual_key_add(0,sys_hud.wheel_pos_y-24,ctrl_move_x,48,ord("Z"));
	//var _xw; if (global.controlMethod=0)
	//	then _xw = [global.hvw,global.hvw]
	//	else _xw = [0,global.vw]
	//ctrl_key_jump = virtual_key_add(_xw[0],0,_xw[1],global.vh,ord("J"));
	//virtual_key_hide(ctrl_key_move); //prevents error
	//virtual_key_hide(ctrl_key_jump); //prevents error
	ctrl_move_click = -1;
	ctrl_move = 0; //-1=left; 1=right;
	ctrl_jump_stick_pos = 0;
	ctrl_jump_pulse = 0;
	ctrl_jumpDive_inRange = false; // Flag for being ready to jump or dive
	ctrl_jumpDive_range = 32; // Range of inRange flag
	ctrl_dive_pulse = 0;
	ctrl_vertical_pulse_timer = -1;

	zone_jump = zone_create(global.hvw, 0, global.vw, global.vh);

}
