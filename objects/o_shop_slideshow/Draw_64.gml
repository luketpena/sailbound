draw_sprite_ext(s_pixel, 0, 0, 0, global.vw, global.vh, 0, c_black, .7);

// Draw first so it appears on top if the scale doesn't fit
var selectedCard = deck[selectIndex];
selectedCard.draw();

for (var i=0; i<cardCount; i++) {
	if (i != selectIndex) {
		var card = deck[i];
		card.draw();
	}
}


draw_set_alpha(1);

draw_set_font(global.font_normal_medium)
draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_set_color(c_white);

draw_text(global.hvw, bottom, selectedCard.title);
draw_set_halign(fa_left);
draw_set_font(global.font_normal_small);

draw_text_ext(32, bottom + 16, string_hash_to_newline(selectedCard.description), 10, global.vw - 64);