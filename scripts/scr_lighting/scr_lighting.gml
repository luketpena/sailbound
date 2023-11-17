function light_create(_x, _y, _sprite, _index, _xscale, _yscale, _blend, _alpha, _fadeDelay = -1, _fadeRate = 0) {
	return instance_create_layer(_x, _y, l_main, o_light_default, {
		sprite_index: _sprite,
		image_index: _index,
		image_xscale: _xscale,
		image_yscale: _yscale,
		image_alpha: _alpha,
		image_blend: _blend,
		targetAlpha: _alpha,
		fadeDelay: _fadeDelay,
		fadeRate: _fadeRate
	});
}
