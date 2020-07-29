behave_step_bouncer();
lighting_flash_step();

if (touched) {
	phy_angular_velocity *= .95;
}

if (wait>0) wait-- else {
	if (image_alpha>0) image_alpha -= .05 else instance_destroy();	
}