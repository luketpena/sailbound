///@description Destroys any floaters assigned to an object
function scr_shadow_cleanup() {

	if instance_exists(shadow) {
		instance_destroy(shadow);	
	}


}
