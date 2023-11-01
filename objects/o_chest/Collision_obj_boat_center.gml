if (!open && obj_boat_front.falling) {
	event_user(0); //Triggers the chest to open
	boat_set_vspeed(-4,-4);
	boat_impact_freeze(.1,5);
}