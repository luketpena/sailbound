if (!global.interfaceOpen) {
	if (interfaceOpenCooldown > 0) interfaceOpenCooldown--
	else if (input.ui.menu.pressed) {
		if (!global.paused)
			then pause()
			else unpause();
	}
} else {
	interfaceOpenCooldown = seconds(.5);
}

if (global.paused) {
	if (input.ui.navY.clickPositive) {
		menuPosition = (menuPosition + 1) mod menuOptionCount;
	}

	if (input.ui.navY.clickNegative) {
		menuPosition = (menuPosition = 0) ? menuOptionCount - 1	: menuPosition - 1;
	}
	
	if (input.ui.select.pressed) {
		disableInput(seconds(.5));
		menuOptions[menuPosition].select();	
	}

	for (var i=0; i<menuOptionCount; i++) {
		var _menuOption = menuOptions[i];
	
		if (menuPosition = i && _menuOption.slideLerp < 1) {
			_menuOption.slideLerp += .05;
			_menuOption.slidePos = ease_lerp(EASE.OutCubic, 0, 1, _menuOption.slideLerp);
		}
	
		if (menuPosition != i && _menuOption.slideLerp > 0) {
			_menuOption.slideLerp -= .1;
			_menuOption.slidePos = ease_lerp(EASE.InCubic, 0, 1, _menuOption.slideLerp);
		}
	}
}