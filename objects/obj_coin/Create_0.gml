fixture_create_box(id, 4, 4, .5, .1, .1, .1, .2, false, true);
behave_init(
	behave.bouncer,
	random_range(.08, .12),
	random_range(2.5, 3.2),
	1,
	true,
	.01,
	.9,
	0,
	.5,
	.05,
	-3);
floater_init(16, 8, true, 4, 5);

active = false;
size = 0;

sink_active = false;
sink_wait = 3 * room_speed;
slideOnGround = 0;

function collect() {
	if (active) {
		create_effect(x, y, l_main, spr_fx_sparkle, 0, 1, c_white, 1, 1, 1, random(360));
		var o = instance_create_layer(x, y, layer, obj_coin_collect);
		o.image_index = image_index;
		instance_destroy();
	}	
}