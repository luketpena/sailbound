if (!active) {
	if (image_alpha > 0) image_alpha -= .1;
	exit;
}

if (image_alpha < 1) image_alpha += .1;	

if keyboard_check_pressed(vk_right) {
	select = loop(select + 1, 0, catalogue_ships_count);
}

if keyboard_check_pressed(vk_left) {
	select = loop(select - 1, 0, catalogue_ships_count);
}

if keyboard_check_pressed(vk_down) {
	select = loop(select + columns, 0, catalogue_ships_count);
}

if keyboard_check_pressed(vk_up) {
	select = loop(select - columns, 0, catalogue_ships_count);
}
selected = stock[select];

array_foreach(stock, function(_item, _index) {
	_item.hover = get_mouse_hovering(_item.x-12, _item.y-12, 24, 24);
	if (_item.hover && mouse_check_button_pressed(mb_left)) {
		select = _index;	
	}
});

if (input.ui.close.pressed) {
	close();	
}

purchaseButton.step();
if (purchaseButton.clicked) {
	purchase();	
}

