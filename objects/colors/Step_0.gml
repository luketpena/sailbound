if (transitioning) {
	if (palette_transition_time < palette_transition_set) {
		palette_transition_time++;
		var transition_lerp = palette_transition_time / palette_transition_set;
		transitionPalette(transition_lerp);
	} else {
		transitioning = false;
		palette = palette_next;
		palette_next = null;
		palette_prev = null;
	}
	
} else {
	setPalette();	
}