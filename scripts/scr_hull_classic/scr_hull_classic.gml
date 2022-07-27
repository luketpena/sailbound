function hull_classic_ko() {
	instance_create_layer(mouse_x, mouse_y, "l_main", obj_hull_classic_debris_front);
	instance_create_layer(mouse_x, mouse_y, "l_main", obj_hull_classic_debris_back);
	repeat(20) {
		instance_create_layer(mouse_x, mouse_y, "l_main", obj_fx_boat_debris);	
	}
}