
function palette_transition(palette_script, speed) {
	instance_destroy(sys_colors_transition);
	var o = instance_create_layer(0,0,"l_system",sys_colors_transition);
	with(o){
		script_execute(palette_script);
		transition_speed = speed;
		active = true;
	}
	return o;
}
