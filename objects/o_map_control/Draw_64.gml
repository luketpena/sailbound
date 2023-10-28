if (levelTextAlpha > 0) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_font(font_compass);
	
	var _yy = global.vh * .75;
	draw_text_outline(global.hvw, _yy, levelText, c_white, 1, c_black, 8, levelTextAlpha);
	
	draw_set_font(font_hope);
	draw_set_valign(fa_middle);
	var _startTextY = _yy + 8;
	
	draw_text_outline(global.hvw, _startTextY - 2, "Start", c_yellow, 1, c_dkgold, 4, levelTextAlpha);
	startInput.draw(global.hvw - (string_width( "Start") / 2) - 12, _startTextY, levelTextAlpha);
}