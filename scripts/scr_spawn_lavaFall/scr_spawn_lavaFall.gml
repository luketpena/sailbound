function spawn_lavaFall() {
	if (!instance_exists(ground) || !instance_exists(ceiling)) exit;
	var _minMax = getSpawnLimitY(Side.Right);
	var _height = _minMax.MAX - _minMax.MIN;
	instance_create_layer(room_width + ceiling.margin, _minMax.MIN, l_main, o_mob_lavaFall, {
		image_yscale: (_height / 16)
	});	
}