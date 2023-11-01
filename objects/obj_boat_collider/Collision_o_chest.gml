if (!other.opened && bounceReady) {
	comboIncrement();
	boat_bounce();
	with(other) {
		image_xscale = 1.1;
		image_yscale = .9;
		open();
	}
}