behave_step_router(false);
var waterpoint = water_find_y_basic(x);
if (waterpoint-y<4) {
		phy_angular_velocity *= .95;
}

if (wait>0) wait-- else {
	if (image_alpha>0) image_alpha -= .05 else instance_destroy();	
}