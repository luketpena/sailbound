function light_create(x, y, sprite, index, xscale, yscale, blend, alpha, fade_wait, fade) {

	var o = instance_create_layer(x,y,"l_main",obj_light_default);

	o.sprite_index = sprite;
	o.image_index = index;
	o.image_xscale = xscale;
	o.image_yscale = yscale;
	o.image_alpha = alpha;
	o.image_blend = blend;
	o.fade_wait = fade_wait;
	o.fade = fade;

	return o;
}
