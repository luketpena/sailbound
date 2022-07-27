if (paused) {
	if sprite_exists(sprite_index) {
		shader_set(shd_maxAlpha)
			draw_sprite_ext(sprite_index, 0, 0, 0, 1, 1, 0, c_dkgray, 1);
		shader_reset();
	}
	
	draw_set_style(global.font_normal_medium, c_white, fa_left, fa_top, 1);
	draw_set_halign(fa_left);
	for (var i=0; i<menuOptionCount; i++) {
		var menuOption = menuOptions[i];
		draw_set_alpha(.5 + .5 * (menuOption.slideLerp * 2));
		draw_text(32 + 32 * menuOption.slidePos, menuPosY + menuOptionHeight * i, menuOption.text);
	}	
}