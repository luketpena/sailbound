if (transitioning) {
	if (palette_transition_time < palette_transition_set) {
		// Palette currently in transition
		palette_transition_time++;
		var transition_lerp = palette_transition_time / palette_transition_set;
		blendPalettes(transition_lerp);
	} else {
		// Palette transition end
		transitioning = false;
		palette = snapToPalette(palette, palette_next);
		palette_next = null;
		palette_prev = null;
		setColorsFromPalette();	
	}
} else {
	// Standard palette blending (doesn't need to happen if single color palette)
	setColorsFromPalette();	
}


// Determine clock and color points
for (var i=0; i<clockPointCount-1; i++) {
	// All other points point to themselves and the previous value
	var _clockPoint = global.clockPoints[i];
	var _nextClockPoint = global.clockPoints[i + 1];

	if (clock.time < _nextClockPoint) {
		currentColorPoint = global.colorPoints[i];
		nextColorPoint = global.colorPoints[i + 1];
		colorBlendAmmount = (clock.time - _clockPoint) / (_nextClockPoint - _clockPoint);
		break;
	}
}
	