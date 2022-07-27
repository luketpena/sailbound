var collisionFunction = function(target) {
	if (bounceReady) {
		// Getting knocked out
		boat_bounce();
		comboIncrement();
		water_splash_create_double(target.x, 24, "medium");
		target.knockout();
	} else {
		if (global.boat_canImpact && target.state = "attack" && target.attacking && !target.attack_impact) {
			target.attack_impact = true;
			target.success = true;
			health_increment(-4);
			boat_impact(90 - (90 * target.face), 3);
			vibrate_set_impulse(1);
		}	
	}
}

triggerQueueCollision(other, collisionFunction);