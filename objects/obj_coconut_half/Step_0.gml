floater_step(0);
behave_step_bouncer();

if (!active) {
	if (abs(phy_angular_velocity)>0) phy_angular_velocity *= .9;	
	if (anim_speed>0) anim_speed *= .95;
}
anim += anim_speed;

if (fade_wait>0) fade_wait-- else {
	if (image_alpha>0) image_alpha -= .05 else instance_destroy();	
}