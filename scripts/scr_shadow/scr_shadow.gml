///@description Creates a companion floater object
///@param width
///@param height
function shadow_init(argument0, argument1) {
	shadow = instance_create_layer(x, y, "l_main", obj_shadow);
	shadow.width = argument0;
	shadow.height = argument1;
	shadow.init();
}


///@description Snaps a floater to the owner location if possible
function shadow_step(_x = x, _y = y) {
	if instance_exists(shadow) {
		shadow.x = _x;
		shadow.y = _y;
	}
}

///@description Destroys any floaters assigned to an object
function shadow_cleanup() {
	if instance_exists(shadow) {
		instance_destroy(shadow);	
	}
}
