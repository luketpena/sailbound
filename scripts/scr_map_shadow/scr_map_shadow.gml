function map_create_shadow(_x, _y,_target, _sprite_index, _image_index, _alpha = .1) {
	var o = instance_create_layer(_x, _y, "l_shadows", o_map_shadow);
	o.image_alpha = _alpha
	o.sprite_index = _sprite_index;
	o.image_index = _image_index;
	o.target = _target;
	
	return o;
}