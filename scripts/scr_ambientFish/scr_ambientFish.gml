function spawn_amb_fish_school() {
	var xx = room_hwidth+(room_hwidth*choose(-1,1));
	var yy = global.water_y+16+random(128);
	var o = instance_create_layer(xx,yy,l_main,obj_amb_fish_school);
	o.init();
}


///@param x
///@param y
///@param cluster
///@param index
///@param config
function Boid(_x, _y, _cluster, index, config) constructor {
	x = _x;
	y = _y;
	dx = 0;
	dy = 0;
	cluster = _cluster;
	speedLimit = random_range(config.speedLimitRange.MIN, config.speedLimitRange.MAX);
	clusterDepth = 0;
	curve = animcurve_get_channel(curve_fishSurfaceResistance, "curve");
	minDistance = irandom_range(config.minDistanceRange.MIN, config.minDistanceRange.MAX);
	centeringFactor = random_range(config.centeringFactorRange.MIN, config.centeringFactorRange.MAX);
	matchingFactor = config.matchingFactor;
	avoidFactor = config.avoidFactor;
	boundMargin = config.boundMargin;
	boundLimit = global.water_y + boundMargin;
	boundTurnFactor = config.boundTurnFactor;
	targetTrackingFactor = config.targetTrackingFactor;
	viewRange = config.viewRange;
	image_angle = 0;
	id = index;


	function step() {
		image_angle += angle_difference(point_direction(0, 0, dx, dy), image_angle) * 0.1;
		if (image_angle > 360) image_angle -= 360;
		if (image_angle < 0) image_angle += 360;
		x += dx;
		y += dy;	
	}

	// Very softly nudges boids to prefer to be horizontal
	function correctToHorizontal() {
		dy *= .999;
	}

	// Keeps boids underneath the water
	function keepWithinBounds() {	
		if (y < boundLimit && dy < 0) {
			var influence = animcurve_channel_evaluate(curve, (1 - (y-global.water_y) / boundMargin));
			dy += boundTurnFactor  * influence;	
		}
	}

	
	function flyTowardsCenter(centerX, centerY) {
		var pdir = point_direction(x, y, centerX, centerY);
		var pdis = point_distance(x, y, centerX, centerY);
		
		dx += lengthdir_x(pdis, pdir) * centeringFactor;
		dy += lengthdir_y(pdis, pdir) * centeringFactor;
	}


	function avoidOthers() {
		var moveX = 0;
		var moveY = 0;
	
		for (var i=0; i<cluster.count; i++) {
			var otherBoid = cluster.children[i];
			if (i != id) {
				var pdis = point_distance(otherBoid.x, otherBoid.y, x, y);
				if (pdis < minDistance) {
					moveX += x - otherBoid.x;
					moveY += y - otherBoid.y;
				}
			}
		}
	
		dx += moveX * avoidFactor;
		dy += moveY * avoidFactor;
	}

	function matchVelocity(avgDx, avgDy) {
		dx += (avgDx - dx) * matchingFactor;
		dy += (avgDy - dy) * matchingFactor;
	}

	function matchSpeed() {
		var mySpeed = point_distance(0, 0, dx, dy);
		var pdir = point_direction(0, 0, dx, dy);
		if (mySpeed > speedLimit) {
			dx = lengthdir_x(speedLimit, pdir);
			dy = lengthdir_y(speedLimit, pdir);
		}
	}

	function moveTowardsTarget() {
		var targetX = cluster.target.x;
		var targetY = cluster.target.y;
		var pdis = point_distance(x, y, targetX, targetY);
		if (pdis < viewRange) {
			cluster.targetActive = false;	
		} else {
			var pdir = point_direction(x, y, targetX, targetY);
			dx += lengthdir_x(1, pdir) * targetTrackingFactor;
			dy += lengthdir_y(1, pdir) * targetTrackingFactor;
		}		
	}
	
	function fleeFromPoint(pointX, pointY, fleeSpeed, fleeRadius) {
		var pdir = point_direction(pointX, pointY, x, y);
		var pdis = point_distance(x, y, pointX, pointY);
		
		var fleeStrength = clamp(1 - (pdis / fleeRadius), 0, 1) * fleeSpeed;
		
		dx += lengthdir_x(fleeStrength, pdir) * 1.5;
		dy += lengthdir_y(fleeStrength, pdir) * .75;
	}
}