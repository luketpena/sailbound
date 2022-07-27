function mob_create_ko(x, y, sprite_hit, sprite_ko, hspeed, vspeed, flip, poofRadius) {
	var o = instance_create_layer(x, y, l_main, obj_mob_ko);
	o.init(sprite_hit, sprite_ko, hspeed, vspeed, flip, poofRadius);
	return o;
}