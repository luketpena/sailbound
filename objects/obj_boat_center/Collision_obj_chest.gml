if (!other.open && obj_boat_front.phy_speed_y>1 && !obj_boat_front.floating) {
	with(other) event_user(0); //Triggers the chest to open
	boat_set_vspeed(-4,-4);
}