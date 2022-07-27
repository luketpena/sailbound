function player_swimming() {	
	// Buoyancy
	var buoyancy_point = collision_point(x,y,obj_block_water,false,true);
	if (buoyancy_point) {
		physics_apply_force(x, y, 0, -20);
	} else {
		if (phy_speed_y < 0) phy_speed_y = 0;
	} 
	
	// Diving
	if (ctrl_vertical_axis > .25) {
		player_setState(is.Diving);
		phy_speed_y = max(phy_speed_y, .5);
	}			
}

///@description Handles state when diving
function player_diving() {
	// Find the surface of the water
	swim_top = collision_release(90, 96, -1, x, bottom, obj_block_water, false);
	var top_dis = y - swim_top[1];	
	
	/// Transition to swimming if surfaced
	if (top_dis < 1 && phy_speed_y < 0) {
		player_setState(is.Swimming);
		phy_speed_y = 0;
		phy_position_y = swim_top[1];
	}
	
	// Apply vertical movement speed or slow down
	if (abs(ctrl_vertical_axis) > .25) {
		physics_apply_force(x, y, 0, 10*ctrl_vertical_axis);		
	} else {
		phy_speed_y *= .95;	
	}
}
