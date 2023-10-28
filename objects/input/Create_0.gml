map = input_group_create([
	new InputAxis("sail_v", ord("W"), ord("S"), gp_axislv),
	new InputAxis("sail_h", ord("A"), ord("D"), gp_axislh),
]);

sail = input_group_create([
	new InputAxis("move_h", ord("A"), ord("D"), gp_axislh),
	new InputAxis("move_v", ord("W"), ord("S"), gp_axislv, gp_face4, gp_face1),
]);

town = input_group_create([
	new InputButton("interact", ord("E"), gp_face3),
]);

ui = input_group_create([
	new InputButton("close", vk_escape, gp_face2),
	new InputButton("menu", vk_escape, gp_select),
	new InputButton("select", vk_space, gp_face1),
	new InputAxis("navX", vk_left, vk_right, gp_axislh, gp_padl, gp_padr),
	new InputAxis("navY", vk_up, vk_down, gp_axislv, gp_padu, gp_padd),
]);



type = InputType.GAMEPAD;
gamepad_set_axis_deadzone(0, .2);

function listenForTypeChange(_gpInputSet, _keyInputSet) {
	switch(type) {
		case InputType.GAMEPAD:
			if (_keyInputSet) setInputType(InputType.KEYBOARD);
			break;
			
		case InputType.KEYBOARD:
			if (_gpInputSet) setInputType(InputType.GAMEPAD);
			break;
	}
}

function setInputType(_type) {
	if (type != _type) {
		type = _type;
		sysLog("Input mode changed: {type}");
	}
}