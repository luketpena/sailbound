if (active && !disabled && !global.interfaceOpen) {
	if (openLerp < 1) openLerp += .05;
	interactInput.step();
	if (interactInput.triggered) {
		if (!is_undefined(interact)) {
			interact();	
		}
	}
} else {
	if (openLerp > 0) openLerp -= .1;	
}

posValue = ease_lerp(EASE.OutCubic, 0, 1, openLerp);