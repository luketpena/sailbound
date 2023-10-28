function create_interactable(_x, _y, _text, _action) {
	var o = instance_create_layer(_x, _y, l_main, prnt_interactable);
	o.interactMessage = _text;
	o.interact = _action;
	return o;
}