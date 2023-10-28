function UI_Button(
	_x, _y, _text
) constructor {
	// Static
	margin = 8;
	dMargin = margin * 2;
	bkg = s_ui_button_bkg;
	bkgSize = sprite_get_width(s_ui_button_bkg);
	bkgScale = 1 / bkgSize;
	color = c_white;
	alpha = 1;
	active = true;
	
	// Dynamic
	x = _x;
	y = _y;
	text = _text;
	hover = false;
	clicked = false;
	
	// Calculated
	draw_set_font(font_compass);
	width = string_width(text);
	height = string_height(text);

	xscale = width / bkgSize;
	yscale = height / bkgSize;
	
	left = x - (width / 2) - margin;
	
	function step() {
		clicked = false;
		if (active) {
			alpha = 1;
			hover = get_mouse_hovering(left, y, width + dMargin, height + dMargin);
			if (hover && mouse_check_button_pressed(mb_left)) {
				clicked = true;
			}
		} else {
			alpha = .5;	
		}
	}
	
	function calculateWidth() {
		draw_set_font(font_compass);
		width = string_width(text);

		xscale = width / bkgSize;
		yscale = height / bkgSize;
	
		left = x - (width / 2) - margin;	
	}
	
	function setText(_text) {
		text = _text;
		calculateWidth();
	}
	
	function draw() {
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_font(font_compass);
		
		draw_sprite_ext(s_ui_button_bkg, 0, left, y, (width + dMargin) * bkgScale, (height + dMargin) * bkgScale, 0, c_white, alpha)
		draw_sprite_ext(s_ui_button_bkg, 1, left, y, (width + dMargin) * bkgScale, (height + dMargin) * bkgScale, 0, c_white, alpha * (hover ? 1 : .5));

		draw_text_color(left + margin, y + margin, text, color, color, color, color, alpha);
	}
}