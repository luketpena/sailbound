image_angle = angle


if (x > room_width) x -= room_width;
if (x < 0) x += room_width;
if (y < 0) y += room_height;
if (y > room_height) y -= room_height;

var _list = ds_list_create();
var _boidCount = collision_circle_list(x, y, viewRadius, boid, false, true, _list, false);

var _totalCount = 0;
var _totalAngle = 0;
var _strength = 0; 


if (active = 1) {
	x += lengthdir_x(moveSpeed, angle);
	y += lengthdir_y(moveSpeed, angle);
	if (_boidCount > 0) {
		var _angles = []; 
		for (var i=0; i<_boidCount; i++) {
			var _boid = _list[| i];
			var _pdir = point_direction(x, y, _boid.x, _boid.y);
			var _pdis = point_distance(x, y, _boid.x, _boid.y);
			
			var _diff = angle_difference(angle, _pdir);
			if (abs(_diff) <= viewAngle) {
				//_strength = max(_strength, _pdis / viewRadius);
				var _turnStrength = (_diff / viewAngle);
				_totalCount++;
				_totalAngle += _diff * _turnStrength;
			}
		}
	}

	goalAngle = angle + (_totalAngle / _totalCount)// * _strength;
	if (goalAngle) {
		angle -= angle_difference(angle, goalAngle) * .05;
	}
}

//ds_list_destroy(_list);