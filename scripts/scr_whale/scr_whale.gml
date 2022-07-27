function whale_start() {
	var xx = -sprite_get_width(spr_whale_head);
	var yy = global.water_y + (sprite_get_height(spr_whale_head) * 2);
	instance_create_layer(xx, yy, "l_below", obj_whale);
}

function whale_end() {
	if (instance_exists(obj_whale)) {
		obj_whale.finish();	
	}
}