function spawn_amb_fish_school() {
	var xx = room_hwidth+(room_hwidth*choose(-1,1));
	var yy = global.water_y+16+random(128);
	var o = instance_create_layer(xx,yy,l_main,obj_amb_fish_school);
	o.init();
}