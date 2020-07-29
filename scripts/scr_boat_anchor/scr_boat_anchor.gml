function motion_stop() {
	instance_create_layer(0,0,l_main,obj_anchor);	
}

function motion_start() {
	global.stop = false;
}