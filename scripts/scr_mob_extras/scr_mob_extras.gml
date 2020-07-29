function mob_create_ko(x,y,sprite_hit,sprite_ko,hspeed,vspeed,flip) {
	var o = instance_create_layer(x,y,l_main,obj_mob_ko);
	o.sprite_index = sprite_hit;
	o.flip = flip;
	o.sprite_ko = sprite_ko;
	o.hspeed_set = hspeed;
	o.vspeed_set = vspeed;
	
	return o;
}