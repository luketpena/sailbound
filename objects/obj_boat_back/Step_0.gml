//setup
pd_boatFront = point_direction(x,y,o_boat_main.x,o_boat_main.y);
water_y = water_find_y_precise(x);
touched = water_y<(y+boat_offset);

//-- Gravity and Buoyancy --\\
if (front.physics_active) {
	
	if (!touched) {
		//gravity
		if (front.gravity_active) {
			physics_apply_force(x,y,0,boat_weight);
		} else {
			phy_speed_y = front.phy_speed_y;
		}
		
		if (impact && front.impactLock = ImpactLock.None) {
			impact = false;
			if (!front.ctrl_jump_pulse) {
				phy_speed_y /= boat_stop;
			}
		}
		
	} else {
		//buoyancy
		
		boat_buoyancy_apply();
		if (!impact) {
			if (front.impactLock = ImpactLock.None) {
				impact = true;
				phy_speed_y /= boat_stop;
			}
		}
	}
}