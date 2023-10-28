function boat_init_pieces() {
	// Create boat back and join
	back = instance_create_layer(x - boat_width, y, "l_main", obj_boat_back);
	center = instance_create_layer(x - boat_width / 2, y + 8, "l_main", obj_boat_center);
	var drawObject = getActiveShipDrawObject();
	draw = instance_create_layer(0, 0, "l_main", drawObject);
	draw.init(hullSprite,  sailSprite);
	
	collider = instance_create_layer(x, y, layer, obj_boat_collider);
	collider.init(colliderWidth, colliderHeight);
	
	physics_joint_distance_create(id, back, x, y, back.x, back.y, false);
	// This is the fixture on which all movement for the boat is calculated.
	// It does not change in size for hulls and is not used in collisions.
	fixture_create_box(center.id, boat_width / 2, 8, 0, 0, 0, 0, 0, false, false, false, false);
}
