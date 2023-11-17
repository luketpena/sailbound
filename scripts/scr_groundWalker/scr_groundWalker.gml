

function Walker(
	_groundOrCeiling,
	_x,
) constructor {
	speed = 0;
	speedMax = 2;
	speedAccel = .1;
	stopDistance = 8;
	walkSurface = _groundOrCeiling;
	type = object_get_name(_groundOrCeiling);
	targetX = _x;
	x = _x;
	y = 0;
	
	function step() {
		if (!instance_exists(walkSurface)) exit;
		
		if (abs(x - targetX) > stopDistance) { 
			var _targetDir = x > targetX ? 	-1 : 1;
			if (_targetDir = 1 && speed < speedMax) speed += speedAccel;
			if (_targetDir = -1 && speed > -speedMax) speed -= speedAccel;
		} else {
			speed *= .8;	
		}
		x += speed;
		
		y = walkSurface.findY(x);
	}
}