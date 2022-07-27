var collisionFunction = function(target) {
	if (global.boat_canDamage) {
		target.explode(false);
	}
}

triggerQueueCollision(other, collisionFunction);
