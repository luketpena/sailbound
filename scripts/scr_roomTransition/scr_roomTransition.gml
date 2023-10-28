function transitionToRoom(roomTarget, saveOnTransition = false, wait = 1000) {
	if (global.paused) {
		menu.unpause();
	}
	var o = instance_create_layer(0, 0, "l_main", obj_roomTransition);
	o.init(roomTarget, saveOnTransition);
}