///@description Holds all boat action input
function boat_step_movement() {

	touched = waterY_front < (y + boat_offset);
	submerged = (waterY_front < (y + boat_offset - 16));
	floating = waterY_center < (y + boat_offset + 4);
	falling = (!touched && phy_speed_y > 1);
	
	//>> Vertical Movement
	if (touched) {
		if (comboCooldown < comboCooldownTarget) comboCooldown ++ else {
			if (global.combo > 0) {
				comboEnd();	
			}
		}
		if (!impact && impactLock = ImpactLock.None) {
			impact = true;
			event_user(15); //Splash event
			if (!ctrl_dive_pulse) {
				phy_speed_y /= boat_stop;
			}
		}
		boat_buoyancy_apply();
	} else {
		comboCooldown = 0;
		if (impact && impactLock = ImpactLock.None) {
			impact = false;
			if (!ctrl_jump_pulse) {
				phy_speed_y /= boat_stop;
			}
		}
		boat_gravity();
	}
	
	//-- Impact Lock --\\
	behavior_impactLock_reset();

	//-- MOVEMENT --\\
	if (abs(ctrl_move)<.1) {
		switch(autopilot) {
			case true:
				if (abs(phy_speed_x)>0) then phy_speed_x *= boat_drag;
			case false:
				if (abs(phy_speed_x)>1) then phy_speed_x *= boat_drag else if (!autopilot) {
					phy_speed_x = 0;
					autopilot_x = x_center_draw;
					autopilot = true;
				}
			break;
		}
	} else {
		if (ctrl_move < 0 && phy_speed_x > total_speed*ctrl_move) physics_apply_impulse(x,y,total_agility*ctrl_move,0);
		else if (ctrl_move > 0 && phy_speed_x < total_speed*ctrl_move) physics_apply_impulse(x,y,total_agility*ctrl_move,0);
		else if abs(phy_speed_x) > 0 then phy_speed_x *= boat_drag;
	}

	//>> Limiting the speeed
	if (phy_speed_x > total_speed)  phy_speed_x =  total_speed;
	if (phy_speed_x < -total_speed) phy_speed_x = -total_speed;
	
	boat_jumpDive_trigger();
}

