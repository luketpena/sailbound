if (active) {
	if (value < 1) {
		value += rate;
	}
} else {
	if (value > 0) {
		value -= rate;	
	}
}