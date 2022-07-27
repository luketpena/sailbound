if !instance_exists(ground) instance_destroy() else {
	// Slide at the rate of ground, destroy when off screen
	if (x > - 64)
		then x += ground.move.speed
		else instance_destroy();
}

var dis = distanceFromBoat(x, y);

if (ready) {
	// When in range and ready, damage the boat if possible
	if (dis < range && global.boat_canDamage) {
		ready = false;
		var dir = directionToBoat(x, y);
		boat_impact(dir, 4, true);
		health_increment(-4);
		vibrate_set_impulse(1);
	}
} else {
	// Reset when out of range after firing
	if (dis > range + resetMargin) {
		ready = true;	
	}
}