floater_step();
behave_step_bouncer();

if (!active && abs(phy_angular_velocity)>0) {
	phy_angular_velocity *= .9;	
}