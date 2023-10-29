if (global.paused) {
	if sprite_exists(sprite_index) {
		shader_set(shd_maxAlpha)
			draw_sprite_ext(sprite_index, 0, 0, 0, 1, 1, 0, c_dkgray, 1);
		shader_reset();
	}
	
	draw_set_style(global.font_normal_medium, c_white, fa_left, fa_top, 1);
	draw_set_halign(fa_left);
	
	for (var i=0; i<menuOptionCount; i++) {
		var _option = menuOptions[i];
		draw_set_alpha(.5 + .5 * (_option.slideLerp * 2));
		draw_text(menuMargin + menuOptionSlideDistance * _option.slidePos, _option.y, _option.text);
	}	
}

if (array_length(inputRow) > 0) {
	draw_set_font(global.font_normal_small);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_alpha(1);
	draw_set_color(c_white);
	
	var _xPos = 16;
	var _gap = 16;
	
	for (var i=0; i<array_length(inputRow); i++) {
		var _text = inputRow[i].getText();
		draw_text(_xPos, global.vh - 8, _text);
		_xPos += _gap + string_width(_text);
	}
	
}