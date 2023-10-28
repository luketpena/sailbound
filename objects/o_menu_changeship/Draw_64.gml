draw_sprite_ext(s_pixel, 0, 0, 0, global.vw, global.vh, 0, c_black, .5);
var gridCorner = new Pos(16, 16);

var activeCard = getActiveCard();
for (var i=0; i<array_length(cards); i++) {
	var card = cards[i];
	var slotX = (i mod columnCount);
	var slotY = (i div columnCount);
	var drawX = gridCorner.x + slotX * gridUnitSize;
	var drawY = gridCorner.y + slotY * gridUnitSize;
	
	if (slotX = selectX && slotY = selectY) {
		draw_sprite_ext(s_ui_slotSelect_24x24, 0, drawX, drawY, 1, 1, 0, c_white, 1);	
	}
	draw_sprite_ext(card.sprite, 0, drawX, drawY, 1, 1, 0, card.color, 1);
}

if (previewInstance != null) {
	previewInstance.draw();
	//event_perform_object(previewInstance, ev_draw, 0);
}
var xx = global.vw * .66;
var yy = global.hvh - 16;

draw_set_font(global.font_normal_medium);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_color(c_white);
draw_set_alpha(1);
draw_text(xx, yy, string_upper(activeCard.name));

draw_set_font(global.font_normal_small);
draw_set_valign(fa_top);
draw_text_ext(xx, yy + 8, activeCard.description, 16, global.vw * .5);


drawButtonPromptText(buttonPrompts);