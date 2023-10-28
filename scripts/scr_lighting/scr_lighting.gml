function light_create(x, y, sprite, index, xscale, yscale, blend, alpha, fadeDelay = -1, fadeRate = 0) {

	var o = instance_create_layer(x, y, "l_main", o_light_default);

	o.sprite_index = sprite;
	o.image_index = index;
	o.image_xscale = xscale;
	o.image_yscale = yscale;
	o.image_alpha = alpha;
	o.targetAlpha = alpha;
	o.image_blend = blend;
	o.fadeDelay = fadeDelay;
	o.fadeDelay = fadeDelay;

	return o;
}
