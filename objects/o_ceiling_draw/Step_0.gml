if (ceiling.exiting) {
	// Transition out of the cave
	if (transitionedPalette) {
		if (ceiling.transitionX < room_width / 2) {
			transitionedPalette = false;
			colors.transition(function() {
				return savedPalette;	
			}, seconds(3));
			lighting.setActive(false);
		}
	}
} else if (!transitionedPalette) {
	// Transition into the cave
	if (ceiling.transitionX < room_width / 2) {
		savedPalette = colors.palette;
		transitionedPalette = true;
		colors.transition(palette, seconds(3));
		lighting.setActive(true);
	}
}