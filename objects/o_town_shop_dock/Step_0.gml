if (active) {
	if (input.ui.navX.clickNegative) {
		select = max(select - 1, 0);	
	}

	if (input.ui.navX.clickPositive) {
		select = min(select + 1, array_length(ships) - 1);	
	}

	if (keyboard_check_pressed(vk_space)) {
		vault.dock.updateActiveShip(ships[select].id);
	}
}