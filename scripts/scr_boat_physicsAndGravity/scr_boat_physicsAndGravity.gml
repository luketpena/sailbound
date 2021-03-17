function boat_physics_init() {
	gravity_active = true;
	physics_active = true;
}

///@description Applies gravity
function boat_gravity() {
	if (gravity_active) {
		switch(back.touched) {
			case true: physics_apply_force(x,y,0,boat_weight*.25); break;
			case false: physics_apply_force(x,y,0,boat_weight); break;
		}
	}
}

///@description Sets the physics lock stats
///@param state [boolean] Toggle true or false
function boat_physics_active_set(state) {
	physics_active = state;
	if (!state) {
		boat_stopMotion();
	}
}

function boat_physics_lock_hold() {
	if (!physics_active) {
		boat_stopMotion();
	}
}

function boat_gravity_findActive() {
	gravity_active = (
		!impactFreeze_active
	);
}
