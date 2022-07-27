dx = 0//random_range(-5, 5);
dy = 0//random_range(-5, 5);
history = [];
viewRange = 50;
cluster = null;
speedLimit = random_range(1.8, 2.2);
clusterDepth = 0;
curve = animcurve_get_channel(curve_fishSurfaceResistance, "curve");

//for (var i=0; i< instance_number(obj_boid); i++) {
//	var _boid = instance_find(obj_boid, i);
//	array_push(cluster.children, _boid);
//}

function correctToHorizontal() {
	var influence = .001;
	
	dy *= (1 - influence);
}

function keepWithinBounds() {
	var margin = 150;
	var turnFactor = .5;
	
	//if (x < margin) {
	//	dx += turnFactor;	
	//}
	
	//if (x > room_width - margin) {
	//	dx -= turnFactor;	
	//}
	
	var limit = global.water_y + margin;
	
	
	if (y < limit && dy < 0) {
		var influence = animcurve_channel_evaluate(curve, (1 - (y-global.water_y) / margin));
		dy += turnFactor  * influence;	
	}
	
	//if (y < global.water_y) {
	//	dy += 1;	
	//}
	
	//if (y > room_height - margin) {
	//	dy -= turnFactor;	
	//}
}

centeringFactor = random_range(0.005, 0.01)
function flyTowardsCenter() {
	//var centeringFactor = 0.002;
	
	var centerX = 0;
	var centerY = 0;
	var numNeighbors = 0;
	
	for (var i=0; i<array_length(cluster.children); i++) {
		var otherBoid = cluster.children[i];
		var pdis = point_distance(otherBoid.x, otherBoid.y, x, y);
		var pdir = point_direction(x, y, otherBoid.x, otherBoid.y);
		if (pdis < viewRange && abs(angle_difference(image_angle, pdir) < 120)) {
			centerX += otherBoid.x;
			centerY += otherBoid.y;
			numNeighbors++;
		}
	}
	
	if (numNeighbors > 0) {
		centerX /= numNeighbors;	
		centerY /= numNeighbors;	
		
		var pdir = point_direction(x, y, centerX, centerY);
		var pdis = point_distance(x, y, centerX, centerY);
		
		dx += lengthdir_x(pdis, pdir) * centeringFactor; //(centerX - x) * centeringFactor;
		dy += lengthdir_y(pdis, pdir) * centeringFactor; // (centerY - y) * centeringFactor;
	}
}

minDistance = irandom_range(5, 22);

function avoidOthers() {
	//var minDistance = 20;
	var avoidFactor = 0.005;
	
	var moveX = 0;
	var moveY = 0;
	
	for (var i=0; i<array_length(cluster.children); i++) {
		var otherBoid = cluster.children[i];
		if (otherBoid.id != id) {
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

function matchVelocity() {
	var matchingFactor = 0.003;
	
	var avgDx = 0;
	var avgDy = 0;
	var numNeighbors = 0;
	
	for (var i=0; i<array_length(cluster.children); i++) {
		var otherBoid = cluster.children[i];
		var pdis = point_distance(otherBoid.x, otherBoid.y, x, y);
		if (pdis < viewRange) {
			avgDx += otherBoid.dx;
			avgDy += otherBoid.dy;
			numNeighbors++;
		}
	}
	
	if (numNeighbors > 0) {
		avgDx /= numNeighbors;
		avgDy /= numNeighbors;
		
		dx += (avgDx - dx) * matchingFactor;
		dy += (avgDy - dy) * matchingFactor;
	}
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

	var influence = .1;
	
	var pdis = point_distance(x, y, targetX, targetY);
	var pdir = point_direction(x, y, targetX, targetY);
	dx += lengthdir_x(1, pdir) * influence;
	dy += lengthdir_y(1, pdir) * influence;
	
	if (pdis < viewRange) {
		cluster.targetActive = false;	
	}
}

