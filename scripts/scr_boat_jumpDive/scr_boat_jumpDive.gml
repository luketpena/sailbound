// The listener that actually triggers the jump and dive actions
function boat_jumpDive_trigger() {
	// Triggering the jump
	if (control_active) {
		// Limits the frequency of jumps
		if (jump_cool > 0) jump_cool--;

		// Checks if it's anywhere in jumping range of the water
		if (ctrl_jumpDive_inRange) {
			if (ctrl_jump_pulse) {
				// Snap to water if submerged and jumping
				boat_jump_action();
				ctrl_jump_pulse = 0;
				if (submerged && distanceToSurface > 24) {
					boat_snapPosition_toWater();
				}
			
			}
		
			if (ctrl_dive_pulse) {
				// Snap to water if still falling and diving
				ctrl_dive_pulse = 0;
				boat_dive_action();
				if (!touched && distanceToSurface > 24) {
					boat_snapPosition_toWater();
				}
			}
		}
	}	
}

///@description Triggers the motion of a jump
function boat_jump_action() {
	impactLock = ImpactLock.Down;
	var limit = 1-abs(phy_speed_y / boat_jump_limit);
	physics_apply_impulse(x, y, 0, -(boat_jump_power) * limit);
	boat_jump_createParticles();
	boat_jumpDive_sharedAction(-1);
	// We want to end combos when the player jumps again, to prevent
	// them from exploiting the combo cooldown when !touch
	comboEnd();
}

///@description Triggers the motion of a dive
function boat_dive_action() {
	impactLock = ImpactLock.Up;
	var limit = 1-abs(phy_speed_y/boat_dive_limit);
	physics_apply_impulse(x, y, 0, (boat_dive_power)*limit);
	boat_jumpDive_sharedAction(1);
}

///@description The shared actionst between jumping and diving
///@param dir -1 for jumping, 1 for diving
function boat_jumpDive_sharedAction(dir) {
	touched_disable = 10;
	var backRate = (dir = -1) ? jumpBackRate : diveBackRate;
	back.phy_speed_y = phy_speed_y * backRate;
	// This just gives a little bit of snap to the motion
	boat_snapPosition_relative(0, 8 * dir);
}

function boat_jump_createParticles() {
	var dir = point_direction(x, y, x+phy_speed_x, y-6);
				
	part_type_color1(pt_water_jump_main, c_water_highlight);
	part_type_color1(pt_water_jump_point, c_water_highlight);
	part_type_direction(pt_water_jump_main, dir, dir, 0, 0);
	part_type_direction(pt_water_jump_point, dir, dir, 0, 0);
				
	part_emitter_region(global.ps_fx_above, pe_water_line, x, obj_boat_back.x, waterY_front, waterY_back, ps_shape_line, ps_distr_gaussian);
	part_emitter_burst(global.ps_fx_above, pe_water_line, pt_water_jump_main, 12);
				
	part_emitter_region(global.ps_fx_above, pe_water_line, x_center_draw-4, x_center_draw+4, waterY_center, waterY_center, ps_shape_line, ps_distr_gaussian);
	part_emitter_burst(global.ps_fx_above, pe_water_line, pt_water_jump_point, 12);		
}

