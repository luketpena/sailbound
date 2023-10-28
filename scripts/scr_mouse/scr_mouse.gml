function get_mouse_hovering(_x, _y, _width, _height) {
	var _mx = device_mouse_x_to_gui(0);
	var _my = device_mouse_y_to_gui(0);

	var _withinXBounds = _mx > _x && _mx < (_x + _width);
	var _withinYBounds = _my > _y && _my < (_y + _height);
	return _withinXBounds && _withinYBounds;	
}