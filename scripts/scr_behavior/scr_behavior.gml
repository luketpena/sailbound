enum behave {
	floater,
	sinker,
	bouncer
}

function behave_init(type,gravity,terminal_fall,terminal_sink,float_active,float_accel,float_friction,radius,impact_reduction,buoyancy,buoyancy_limit) {
	behave_type = type;

	behave_gravity = gravity;
	behave_terminal_fall = terminal_fall;
	behave_terminal_sink = terminal_sink;
	behave_float_active = float_active;
	behave_float_accel = float_accel;
	behave_float_friction = float_friction;
	behave_radius = radius;
	behave_mode = "fall"; //State for current action - starts at "fall" for all behave_types

	behave_impact_reduction = impact_reduction;
	behave_buoyancy = buoyancy;
	behave_buoyancy_limit = buoyancy_limit;
	
	touched = false;
	impactLock = ImpactLock.None;

	waterpoint_y = 0; //The y position of the nearest water vertex
	waterpoint_distance = 0; //The distance to that point
}

function behave_step_router(precise) {
	switch(behave_type) {
		case behave.floater: behave_step_floater(precise); break;	
		case behave.sinker: behave_step_sinker(); break;	
		case behave.bouncer: behave_step_bouncer(); break;	
	}
}

function behave_step_floater(precise) {

	//Calculating distance to water
	var collision_y = phy_position_y+behave_radius;
	if (precise)
		then waterpoint_y = water_find_y_precise(x)
		else waterpoint_y = water_find_y_basic(x);
	waterpoint_distance = collision_y-waterpoint_y;

	switch(behave_mode) {
	
		case "fall":
			if (waterpoint_distance>=0) {
				//Trigger impact when close to water
				behave_mode = "impact";
				touched = true;
				phy_speed_y *= behave_impact_reduction;
			} else {
				//Falling
				if (phy_speed_y<behave_terminal_fall) phy_speed_y += behave_gravity;	
			}
			break;
		
		case "impact":
			if (waterpoint_distance>0) {
				//Float when submerged
				phy_speed_y = max(phy_speed_y-behave_buoyancy,behave_buoyancy_limit);
			} else {
				//Trigger float when close to surface
				behave_mode = "float";
				phy_speed_y = 0;
			}
			//Applying the influence of the ocean current
			behave_oceanCurrent();
			break;
	
		case "float":
			//Snapping y position to water surface
			phy_position_y += (waterpoint_y-collision_y)*.5;
			break;
	}
}

function behave_step_bouncer() {

	//Calculating distance to water
	var collision_y = phy_position_y+behave_radius;
	waterpoint_y = water_find_y_basic(x);
	waterpoint_distance = collision_y-waterpoint_y;

	if (abs(phy_speed_y)<1 && abs(waterpoint_distance)<1) phy_speed_y = 0;
	
	behavior_impactLock_reset();

	switch(behave_mode) {
	
		case "fall":
			if (waterpoint_distance>=0) {
				//Trigger impact when close to water
				behave_mode = "impact";
				event_user(15); //Splash event
				if (impactLock = ImpactLock.None) {
					phy_speed_y *= behave_impact_reduction;
				}
				touched = true;
			} else {
				//Falling
				if (phy_speed_y<behave_terminal_fall) phy_speed_y += behave_gravity;	
			}
			break;
		
		case "impact":
			if (waterpoint_distance>0) {
				//Float when submerged
				phy_speed_y = max(phy_speed_y-behave_buoyancy,behave_buoyancy_limit);
			} else {
				//Trigger float when close to surface
				behave_mode = "fall";
			}
			//Applying the influence of the ocean current
			behave_oceanCurrent();
			break;	
	}


}

function behavior_impactLock_reset() {
	var resetDown = (phy_speed_y > 0 && impactLock = ImpactLock.Down);
	var resetUp = (phy_speed_y < 0 && impactLock = ImpactLock.Up);
	if (resetDown || resetUp) {
		impactLock = ImpactLock.None;	
	}
}

function behave_step_sinker() {

	//Calculating distance to water
	var collision_y = phy_position_y + behave_radius;
	waterpoint_y = water_find_y_basic(x);
	waterpoint_distance = collision_y-waterpoint_y;

	switch(behave_mode) {
	
		case "fall":
			if (waterpoint_distance>=0) {
				//Trigger impact when close to water
				behave_mode = "sink";
				phy_speed_y *= behave_impact_reduction;
				touched = true;
			} else {
				//Falling
				if (phy_speed_y<behave_terminal_fall) phy_speed_y += behave_gravity;	
			}
			break;
		
		case "sink":
			if (waterpoint_distance<0) {
				behave_mode = "fall";	
			} else {
				if (phy_speed_y>behave_terminal_sink) {
					phy_speed_y -= behave_buoyancy;
				} else if (phy_speed_y<behave_terminal_sink) {
					phy_speed_y += behave_gravity*.1;	
				}
			}
		
			//Applying the influence of the ocean current
			behave_oceanCurrent();
			break;
			
		default:
			behave_mode = "fall";
			break;

	}


}

function behave_oceanCurrent() {
	if (behave_float_active) {
		if (abs(phy_speed_x)>global.water_speed) {
			phy_speed_x *= behave_float_friction;	
		} else {
			phy_speed_x -= behave_float_accel;	
		}
	}
}