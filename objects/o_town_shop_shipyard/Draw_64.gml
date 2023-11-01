if (image_alpha > 0) {
	draw_set_color(c_white);
	// Drawing the background
	draw_sprite_ext(s_pixel, 0, 0, 0, global.hvw, global.vh, 0, c_black, .65 * image_alpha);
	draw_sprite_ext(s_pixel, 0, global.hvw, 0, global.vw, global.vh, 0, c_black, .5 * image_alpha);
	
	// Drawing the individual stock items
	array_foreach(stock, function(_item, _index) {
		if (select == _index) {
			draw_sprite_ext(s_ui_slotSelect_24x24, 0, _item.x, _item.y, 1, 1, 0, c_white, image_alpha);
		}
		
		if (_item.hover) {
			draw_sprite_ext(s_ui_slotSelect_24x24, 0, _item.x, _item.y, 1, 1, 0, c_white, .25 * image_alpha);
		}
		 
		// Sillhouette if not knowable
		var _c = _item.status == ShipPartStatus.Undiscovered ? c_black : c_white;
		// Only full alpha is purchasable
		var _a = 
			(_item.status == ShipPartStatus.Damaged ||
			 _item.status == ShipPartStatus.Available ||
			 _item.status == ShipPartStatus.Destroyed) ? 1 : .25;
		draw_sprite_ext(_item.entry.orbSprite, 0, _item.x, _item.y, 1, 1, 0, _c, _a * image_alpha);
	});
	
	// Drawing the ship highlighted + description
	
	var _selectedHidden = selected.status == ShipPartStatus.Undiscovered;
	draw_set_style(global.font_normal_medium, c_white, fa_center, fa_bottom, 1);
	
	// The name of the ship
	draw_text(preview_x, preview_y, _selectedHidden ? "???" : selected.entry.name);
	// Subtext describing the status of the hull
	draw_set_font(global.font_normal_small);
	var _subtext = "";
	var _actionText = "";
	var _cost = "";
	switch(selected.status) {
		case ShipPartStatus.Owned:
			_subtext = "purchased";
			break;
		case ShipPartStatus.Damaged:
			_subtext = "damaged";
			_actionText = "Repair";
			_cost = selected.repairCost;
			break;
		case ShipPartStatus.Destroyed:
			_subtext = "destroyed";
			_actionText = "Reforge";
			break;
		case ShipPartStatus.Lost:
			_subtext = "lost";
			break;
		case ShipPartStatus.Available:
			_actionText = "Forge";
			_cost = selected.purchaseCost;
			break;
	}
	draw_text(preview_x, preview_y + 16, _subtext);
	
	if (_actionText != "") {
		purchaseButton.setText(_actionText);
		purchaseButton.draw();	
	}
	
	// Drawing your gold count + cost to purchase
	draw_set_color(c_gold);
	if (_cost != "") draw_text(preview_x, preview_y + 32, _cost);
	
	draw_set_halign(fa_right);
	draw_text(global.vw - 8, global.vh - 8, $"coins {vault.bank.gold}");
}