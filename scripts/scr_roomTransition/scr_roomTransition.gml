function transitionToRoom(roomTarget) {
	var o = instance_create_layer(0, 0, "l_main", obj_roomTransition);
	o.roomTarget = roomTarget;
}