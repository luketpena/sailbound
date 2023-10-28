if (active) {
	draw_sprite_ext(s_pixel, 0, 0, 0, global.vw, global.vh, 0, c_black, .65 * image_alpha);
	
	for (var i=0; i<array_length(ships); i++) {
		var _ship = ships[i];
		var _unitW = 32;
		var _xx = global.hvw + (_unitW * i) - (_unitW * select);
		draw_sprite_ext(_ship.orbSprite, 0, _xx, global.vh * .75, 1, 1, 0, c_white, image_alpha);
		if (vault.dock.activeShip = _ship.id) {
			draw_sprite_ext(s_ui_slotSelect_24x24, 0, _xx, global.vh * .75, 1, 1, 0, c_lime, image_alpha);
		}
	}
	
	draw_sprite_ext(s_ui_slotSelect_24x24, 0, global.hvw, global.vh * .75, 1, 1, 0, c_white, .5 * image_alpha);
}