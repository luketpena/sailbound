//setup
pd_boatFront = point_direction(x,y,obj_boat_front.x,obj_boat_front.y);
//>>collisions

water_y = water_find_y_precise(x);
touched = water_y<(y+boat_offset);

//-- Gravity and Buoyancy --\\
if (obj_boat_front.physics_active) {
	if (!touched) {
		//gravity
		if (obj_boat_front.gravity_active) {
			physics_apply_force(x,y,0,boat_weight);
		}
		else {
			phy_speed_y = obj_boat_front.phy_speed_y;
		}
		impact = false;
	} else {
		//buoyancy
		boat_buoyancy_apply();
		if (!impact) {
			if (obj_boat_front.impact_lock=0) {
				impact = true;
				phy_speed_y /= boat_stop;
			}
		}
	}
}