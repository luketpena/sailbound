if (openLerp > 0) {

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(font_compass);
	draw_set_alpha(openLerp);
	var _textWidth = string_width(text);
	var _yy = y + offset_y - (4 * posValue);
	interactInput.draw(x - (_textWidth / 2) - 12 , _yy, openLerp);
	draw_text_outline(x, _yy, text, c_white, 1, c_black, 8, openLerp);
}