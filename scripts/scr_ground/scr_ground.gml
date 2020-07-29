function spawn_ground(target_y) {
	var thickness = (room_height-target_y)/2;
	var o = instance_create_layer(global.vr+room_hwidth,target_y+thickness,l_main,obj_ground);
	o.init(target_y);
}