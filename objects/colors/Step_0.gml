if (transitioning) {
	if (palette_transition_time < palette_transition_set) {
		// Palette currently in transition
		palette_transition_time++;
		var transition_lerp = palette_transition_time / palette_transition_set;
		transitionPalette(transition_lerp);
	} else {
		// Palette transition end
		transitioning = false;
		palette = palette_next;
		palette_next = null;
		palette_prev = null;
	}
} else {
	// Standard palette blending
	setPalette();	
}
