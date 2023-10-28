

if (dice(10)) {
	var _ld = lengthdir(random(global.vw), random(360));
	instance_create_layer(o_map_player.x + _ld[0], o_map_player.y + _ld[1], "l_water_surface", o_map_wave);
}


if mouse_check_button_pressed(mb_right) {
	instance_create_layer(o_map_player.x, o_map_player.y, "l_water_surface", o_map_wave);	
}




