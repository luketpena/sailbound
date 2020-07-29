///@description Creates a companion floater object
///@param width
///@param height
function scr_shadow_init(argument0, argument1) {

	shadow = instance_create_layer(x,y,"l_main",obj_shadow);
	shadow.width = argument0;
	shadow.height = argument1;

	with(shadow) event_user(0);


}
