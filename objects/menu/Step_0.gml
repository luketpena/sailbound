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
	if (input.type == InputType.GAMEPAD) {
		// -- Navigating Options --
		if (input.ui.navY.clickPositive) {
			menuPosition = (menuPosition + 1) mod menuOptionCount;
		}

		if (input.ui.navY.clickNegative) {
			menuPosition = (menuPosition = 0) ? menuOptionCount - 1	: menuPosition - 1;
		}
	
		// -- Selecting option --
		if (input.ui.select.pressed) selectOption();
	}
	
	// -- Mouse hover --
	if (input.type == InputType.KEYBOARD) {
		menuPosition = -1;
		array_foreach(menuOptions, function(_option, _index) {
			draw_set_font(global.font_normal_medium);
			var _width = string_width(_option.text);
			_option.hover = get_mouse_hovering(0, _option.y - 4, _width + menuMargin + menuOptionSlideDistance, menuOptionHeight);
			if (_option.hover) {
				menuPosition = _index;
			}
		});
		if (mouse_check_button_pressed(mb_left)) selectOption();
	}

	// -- Animating option movement --
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