var collisionFunction = function(target) {
	if (bounceReady) {
		with(target) {
			knockout();
		}
		boat_bounce();
		clearBounceReady();
		comboIncrement();
	}
}

triggerQueueCollision(other, collisionFunction);