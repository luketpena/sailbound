var collisionFunction = function(target) {
	if (global.boat_canDamage && target.active) {
		health_increment(-1);
		var dir = point_direction(target.x, target.y, global.boat_x, global.boat_y);
		boat_impact(dir, 6);
		vibrate_set_impulse(1);
		target.impact();
	}	
}

if (global.boat_canImpact) {
	collisionFunction(other);	
} else {
	addToQueue(other, collisionFunction);
}
