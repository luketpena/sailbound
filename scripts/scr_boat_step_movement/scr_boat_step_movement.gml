///@description Holds all boat action input
function boat_step_movement() {

	touched = waterpoint_front<(y+boat_offset);
	submerged = (waterpoint_front<(y+boat_offset-16));
	floating = waterpoint_center<(y+boat_offset+4);
	falling = (!touched && phy_speed_y>.5);

	//>> Vertical Movement
	if (touched) {
		if (!impact && impact_lock=0) {
			impact = true;
			event_user(15); //Splash event
			phy_speed_y /= boat_stop;
		}
		if (touched) {
			boat_buoyancy_apply();
		} 
	} else {
		impact = false;
		switch(back.touched) {
				case true: physics_apply_force(x,y,0,boat_weight*.25); break;
				case false: physics_apply_force(x,y,0,boat_weight); break;
			}
	}
	
	//-- Impact Lock --\\
	if ((impact_lock=1 && phy_speed_y<0) || (impact_lock=-1 && phy_speed_y>0)) impact_lock = 0;

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
	
	if (control_active) {
	
		//>> CHECKING IF READY TO JUMP
		jump_ready = abs(y_center_draw-waterpoint_center)<32 && floating;
		if jump_cool > 0 jump_cool--;

		if (jump_ready) {
			if (ctrl_jump_pulse) {
				impact_lock = -1;
				var limit = 1-abs(phy_speed_y/boat_jump_limit);
				physics_apply_impulse(x,y,0,-(boat_jump_power)*limit);
				back.phy_speed_y = phy_speed_y*.8
				touched_disable = 10;
				
				//Jump particle effect
				var dir = point_direction(x,y,x+phy_speed_x,y-6);
				
				part_type_color1(pt_water_jump_main,global.c_water_horizon);
				part_type_color1(pt_water_jump_point,global.c_water_horizon);
				part_type_direction(pt_water_jump_main,dir,dir,0,0);
				part_type_direction(pt_water_jump_point,dir,dir,0,0);
				
				part_emitter_region(global.ps_fx_above,pe_water_line,x,obj_boat_back.x,waterpoint_front,waterpoint_back,ps_shape_line,ps_distr_gaussian);
				part_emitter_burst(global.ps_fx_above,pe_water_line,pt_water_jump_main,12);
				
				part_emitter_region(global.ps_fx_above,pe_water_line,x_center_draw-4,x_center_draw+4,waterpoint_center,waterpoint_center,ps_shape_line,ps_distr_gaussian);
				part_emitter_burst(global.ps_fx_above,pe_water_line,pt_water_jump_point,12);
			}
		
			if (ctrl_dive_pulse) {	
				impact_lock = 1;
				var limit = 1-abs(phy_speed_y/boat_dive_limit);
				physics_apply_impulse(x,y,0,(boat_dive_power)*limit);
				back.phy_speed_y = phy_speed_y*.9;
				touched_disable = 10;
			}
		}
	}


}
