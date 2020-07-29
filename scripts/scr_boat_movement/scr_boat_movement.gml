
function boat_set_vspeed(vspeed_front, vspeed_back) {
	obj_boat_front.phy_speed_y = vspeed_front;
	obj_boat_back.phy_speed_y = vspeed_back;
	
	if (vspeed_front>0)
		then obj_boat_front.impact_lock = 1
		else obj_boat_front.impact_lock = -1;
}

function boat_set_hspeed(hspeed_front, hspeed_back) {
	obj_boat_front.phy_speed_x = hspeed_front;
	obj_boat_back.phy_speed_x = hspeed_back;
}

function boat_step_impact_freeze() {
	if (impact_freeze>-1) {
		if (impact_freeze=0) {
			//Reactivate the object after freezing
			physics_active = true;
			phy_speed_x = impact_freeze_speed_front[0];
			phy_speed_y = impact_freeze_speed_front[1];
			back.phy_speed_x = impact_freeze_speed_back[0];
			back.phy_speed_y = impact_freeze_speed_back[1];
			//Boosts the boat in the saved direction
			var _boost = [
				phy_speed_x*impact_freeze_multiplier,
				phy_speed_y*impact_freeze_multiplier
			];
			phy_position_x += _boost[0];
			phy_position_y += _boost[1];
			back.phy_position_x += _boost[0];
			back.phy_position_y += _boost[1];
		}
		//Count down until the end
		impact_freeze--;
	}
}

function boat_impact_freeze(duration,postMultiplier) {
	with(obj_boat_front) {
		//Save the current speed
		impact_freeze_speed_front = [
			phy_speed_x,
			phy_speed_y
		];
		impact_freeze_speed_back = [
			obj_boat_back.phy_speed_x,
			obj_boat_back.phy_speed_y
		];
		
		//Stop the motion
		boat_set_hspeed(0,0);
		boat_set_vspeed(0,0);
		
		//Set the timer till unfreeze
		impact_freeze = ceil(duration*room_speed);
		impact_freeze_multiplier = postMultiplier;
	}
}