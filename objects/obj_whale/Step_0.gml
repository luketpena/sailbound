puppet.x = x;
puppet.y = y;

if (spoutTimer > -1) {
	spoutObject.x = puppet.spout.x;
	spoutObject.y = puppet.spout.y;
	if (spoutTimer > 0) spoutTimer-- else {
		spoutTimer = -1;
		instance_destroy(spoutObject);
	}
}

// Horizontal movement
var _arrivedX = abs(x - target[0]) < 4;
if (!_arrivedX) {;
	var _targetSpeed = clamp((target[0] - x) * .01, -maxMoveSpeed, maxMoveSpeed)
	if (speedX < _targetSpeed) speedX += accelX;
	if (speedX > _targetSpeed) speedX -= accelX;
} else {
	speedX *= .01;	
}
x += speedX;

// Vertical movement
var _arrivedY = abs(y - target[1]) < 4;
if (!_arrivedY) {;
	var _targetSpeed = clamp((target[1] - y) * .01, -maxMoveSpeed, maxMoveSpeed)
	if (speedY < _targetSpeed) speedY += accelY;
	if (speedY > _targetSpeed) speedY -= accelY;
} else {
	speedY *= .01;	
}
y += speedY;

if (active) {
	if (_arrivedX) {
		if (complete) 
			then instance_destroy()	
			else setHorizontalTarget();
	}

	if (!complete) {
		if (_arrivedY && !breaching) {
			setVerticalTarget(false);	
		}
	
		// Surfacing to spout
		if (breachCountdown > 0) breachCountdown-- else {
			if (!breaching) {
				setVerticalTarget(true);
				breaching = true;
			}
		
			if (puppet.spoutSurfaced) {
				spoutObject = instance_create_layer(puppet.spout.x, puppet.spout.y, layer, obj_whale_spout_hitbox);
				spoutTimer = 1.5 * room_speed;
				breaching = false;
				breachCountdown = irandom_range(breachTimingRange[0], breachTimingRange[1]);
				setVerticalTarget(false);
			}
		}
	}
} else {
	var distanceToFirstPoint = point_distance(x, y, target[0], target[1]);
	if (distanceToFirstPoint < 32) init();
} 

var _distanceToSurface = y - global.water_y;
var _surfaceTargetDis = 100;
if (_distanceToSurface < _surfaceTargetDis) {
	var _tiltValue = 1 - clamp(_distanceToSurface / _surfaceTargetDis, 0, 1);
	puppet.changeDirection(15 * _tiltValue)
}