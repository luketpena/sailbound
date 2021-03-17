///@description Sets up the variables for impact freeze
function boat_impactFreeze_init() {
	impactFreeze_timer = -1; //How long it freezes for
	impactFreeze_boost = 1; //How much it spikes the movement after it unfreezes
	impactFreeze_speed_front = new Pos();
	impactFreeze_speed_back = new Pos();
	impactFreeze_active = false;
}

///@description Waits and then sets the boat speed when the freeze is done
function boat_impactFreeze_step() {
	if (impactFreeze_timer > -1) {
		if (impactFreeze_timer = 0) {
			//Reactivate the object after freezing
			impactFreeze_active = false;
			boat_gravity_findActive();
			boat_physics_active_set(true);

			boat_set_hspeed(impactFreeze_speed_front.x, impactFreeze_speed_back.x);
			boat_set_vspeed(impactFreeze_speed_back.y, impactFreeze_speed_back.y);
			//Boosts the boat in the saved direction
			var _boost = new Posx(phy_speed_x * impactFreeze_boost, phy_speed_y * impactFreeze_boost);
			boat_snapPosition_relative(_boost.x, _boost.y);
		}
		//Count down until the end
		impactFreeze_timer--;
	}
}

///@description Starts an impact freeze
///@param duration How long in seconds it freezes
///@param boost how much the speed is multiplied when the freeze is over
function boat_impactFreeze_trigger(duration, boost) {
	with(obj_boat_front) {
		//Save the current speed
		impactFreeze_speed_front = {
			x: phy_speed_x,
			y: phy_speed_y,
		}
		impactFreeze_speed_back = {
			x: obj_boat_back.phy_speed_x,
			y: obj_boat_back.phy_speed_y
		};
		
		impactFreeze_active = true;
		boat_gravity_findActive();
		boat_physics_active_set(false);
	
		// Set the timer till unfreeze
		impactFreeze_timer = ceil(duration*room_speed);
		impactFreeze_boost = boost;
	}
}