var collisionFunction = function(target) {
	if (global.boat_canImpact && bounceReady) {
		target.impact();
		boat_bounce();
		clearBounceReady();
		comboIncrement();
	}
}

if (other.active) {
	triggerQueueCollision(other, collisionFunction);
}
