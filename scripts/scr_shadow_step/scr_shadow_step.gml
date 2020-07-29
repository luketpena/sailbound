///@description Snaps a floater to the owner location if possible
function scr_shadow_step() {


	if instance_exists(shadow) {
		shadow.x = x;
		shadow.y = y;
	}


}
