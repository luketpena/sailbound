function event_whale_start() {
	var xx = -sprite_get_width(s_whale_head);
	var yy = global.water_y + (sprite_get_height(s_whale_head) * 2);
	instance_create_layer(xx, yy, "l_below", o_whale);
}

function event_whale_end() {
	if (instance_exists(o_whale)) {
		o_whale.finish();	
	}
}