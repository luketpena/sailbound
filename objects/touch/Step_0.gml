if (debug) {
	
	
	if (click) {
		var f = finger(click_index);
		testx3(f.pos.x, f.pos.y, debugColor(click_index), ef_flare);
	}
	
	if (tap) {
		var f = finger(tap_index);
		testx3(f.pos.x, f.pos.y, debugColor(tap_index), ef_ring);
	}
}