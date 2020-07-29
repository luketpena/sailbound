if (global.motion>0) {
	x -= mySpeed*global.motion;
}

switch(state) {
	case "enter":
		//if (x<=room_width/2) {
		//	state = "stop";
		//	motion_stop();
		//	sys_hud.hud_active = false;
		//}
		break;
		
	case "exit":
		if (x<0) instance_destroy();
		break;
}