function boat_buoyancy_apply() {
	if (obj_boat_front.gravity_active) {
		physics_apply_force(x,y,0,( (global.water_y-phy_position_y)*.2 - 60 )*boat_buoyancy)
	}
}
