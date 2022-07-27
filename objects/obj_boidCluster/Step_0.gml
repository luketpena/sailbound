if (active) {
	var centerX = 0;
	var centerY = 0;
	var avgDx = 0;
	var avgDy = 0;
	for (var i=0; i<count; i++) {
		var boid = children[i];
		centerX += boid.x;
		centerY += boid.y;
		avgDx += boid.dx;
		avgDy += boid.dy;
	}

	centerX /= count;
	centerY /= count;
	avgDx /= count;
	avgDy /= count;

	var boatRange = 32;
	var boatInRange =  (boat.submerged && point_distance(centerX, centerY, boat.x_center, boat.y_center) < boatRange);

	for (var i=0; i<count; i++) {
		var boid = children[i];
		boid.flyTowardsCenter(centerX, centerY);
		boid.avoidOthers();
		boid.matchVelocity(avgDx, avgDy);
		boid.matchSpeed();
		boid.keepWithinBounds();
		boid.correctToHorizontal();
		if (targetActive) {
			boid.moveTowardsTarget();	
		}
		if (boatInRange) {
			boid.fleeFromPoint(boat.x_center, boat.y_center, .5, boatRange);
		}
		boid.step();
	}
}