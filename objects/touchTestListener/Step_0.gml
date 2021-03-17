if (touch.hold) {
	testValue = touch.hold_index;
}

var touched = touch.zone_swipe(zone);
if (touched) {
	testx2(mouse_x, mouse_y-32, c_white);	
}