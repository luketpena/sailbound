function boat_init_pieces() {
	// Create boat back and join
	back = instance_create_layer(x-boat_width,y,"l_main",obj_boat_back);
	physics_joint_distance_create(id,back,x,y,back.x,back.y,false);
	center = instance_create_layer(x-boat_width/2,y+8,"l_main",obj_boat_center);
	fixture_create_box(center.id,boat_width/2,8,0,0,0,0,0,false,false);
	instance_create_layer(0,0,"l_main",obj_boat_draw);
}
