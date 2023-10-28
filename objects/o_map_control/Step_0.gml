if (global.transitioning) {
	if (levelTextAlpha > 0) levelTextAlpha -= .1;
	exit;
}

if (global.targetLevel != noone) {
	levelText = global.targetLevel.name;
	if (levelTextAlpha < 1) levelTextAlpha += .1;
	startInput.step();
	if (startInput.triggered) {
		startInput.active = false;
		global.level_id = global.targetLevel.level_id;
		transitionToRoom(r_water);		
	}
} else {
	if (levelTextAlpha > 0) levelTextAlpha -= .1;	
}





