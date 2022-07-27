var collisionFunction = function(target) {
	if (global.boat_canDamage) {
		health_increment(-2);
		boat_impact(target.dir, 4);
		vibrate_set_impulse(1);
	}	
}

if (global.boat_canImpact) {
	collisionFunction(other);	
} else {
	addToQueue(other, collisionFunction);
}
