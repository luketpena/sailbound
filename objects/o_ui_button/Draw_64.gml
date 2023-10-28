draw_set_style(font_compass, c_white, fa_left, fa_middle, 1);
draw_set_font(font_compass);

draw_sprite_ext(s_ui_button_bkg, 0, x, y, (width + (margin * 2)) * bgScale, image_yscale, 0, c_white, 1)
draw_sprite_ext(s_ui_button_bkg, 1, x, y, (width + (margin * 2)) * bgScale, image_yscale, 0, c_white, hover ? 1 : .5)

draw_text(x + textX, y + height / 2, text);

if (gpMode) {
	hold.draw(x + margin + 10, y + height / 2);
}

log("Drawing  button");