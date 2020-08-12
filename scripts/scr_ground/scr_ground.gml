function spawn_ground(target_y,ground_sprite) {
	var thickness = (room_height-target_y)/2;
	var o = instance_create_layer(room_width*2,target_y+thickness,l_main,obj_ground);
	o.init(target_y,ground_sprite);
}