//Adjusts motion in other objects
function makeMotionAdjustments() {
	part_type_speed(global.pt_water_wake_surface,0,global.motion,0,0);
	with(sys_water_front) part_type_speed(pt_water_front_current, 0.10*global.motion, 1*global.motion, 0, 0);	
}

//Actually pulls back the speed
if (global.stop) {
	if (global.motion>0) {
		global.motion -= .01;
		makeMotionAdjustments();
	}
} else {
	if (global.motion<1) {
		global.motion += .01;	
		makeMotionAdjustments();
	} else instance_destroy();
}