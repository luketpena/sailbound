function create_interactable(_x, _y, _text, _width, _height, _offsetY = -32, _action = undefined) {
	var o = instance_create_layer(_x, _y, l_main, prnt_interactable, {
		text: _text,
		offset_y: _offsetY,
		width: _width,
		height: _height
	});
	o.interact = _action;
	return o;
}