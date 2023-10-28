function drawButtonPromptText(textArray) {
	draw_set_font(global.font_normal_small);
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	var displayText = array_join(textArray, "  ");
	draw_text_color1(global.vw - 16, global.vh - 16, displayText, c_white, 1);	
}