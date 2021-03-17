function boat_bounce() {
	boat_set_vspeed(-4, -4);
	boat_impactFreeze_trigger(.05, 5);
	vibrate_set_impulse(.5);
}