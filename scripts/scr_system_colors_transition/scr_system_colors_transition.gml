///@description Creates a transition between two color palettes
///@param palette
///@param transition_speed
function scr_system_colors_transition(argument0, argument1) {

	instance_destroy(sys_colors_transition);
	var o = instance_create_layer(0,0,"l_system",sys_colors_transition);
	with(o){
		script_execute(argument0);
		transition_speed = argument1;
		active = true;
	}


}
