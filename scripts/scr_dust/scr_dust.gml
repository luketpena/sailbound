function dust_create_run(x, y, face) {
	var o = instance_create_layer(x, y, "l_dust", obj_dust);
	o.sprite_index = spr_fx_dust_run;
	o.image_xscale = face;
}

function dust_create_jump(x, y) {
	var o = instance_create_layer(x, y, "l_dust", obj_dust);
	o.sprite_index = spr_fx_dust_jump;
}

function dust_create_land(x, y) {
	var o = instance_create_layer(x, y, "l_dust", obj_dust);
	o.sprite_index = spr_fx_dust_land;
}
