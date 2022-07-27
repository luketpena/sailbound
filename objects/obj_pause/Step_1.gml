if gamepad_button_check_pressed(0, gp_start) {
	if (!paused) pause() else unpause();
}


if (paused) {
	if gamepad_button_check_pressed(0, gp_padd) {
		menuPosition = (menuPosition + 1) mod menuOptionCount;
	}

	if gamepad_button_check_pressed(0, gp_padu) {
		menuPosition = (menuPosition = 0) ? menuOptionCount - 1	: menuPosition - 1;
	}
	
	if gamepad_button_check_pressed(0, gp_face1) {
		menuOptions[menuPosition].select();	
	}

	for (var i=0; i<menuOptionCount; i++) {
		var menuOption = menuOptions[i];
	
		if (menuPosition = i && menuOption.slideLerp < 1) {
			menuOption.slideLerp += .025;
			menuOption.slidePos = ease_lerp(EASE.OutElastic, 0, 1, menuOption.slideLerp);
		}
	
		if (menuPosition != i && menuOption.slideLerp > 0) {
			menuOption.slideLerp -= .1;
			menuOption.slidePos = ease_lerp(EASE.InCubic, 0, 1, menuOption.slideLerp);
		}
	}
}