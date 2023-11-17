function ground_setBumpConfig(_offsetMinMax, _durationMinMax, _frequencyMinMax) {
	if (!instance_exists(ground)) exit;
	ground.setBumpConfig(_offsetMinMax, _durationMinMax, _frequencyMinMax);
}

function ground_setBumpActive(_active) {
	if (!instance_exists(ground)) exit;
	ground.bumpActive = _active;
}

function ceiling_setBumpConfig(_offsetMinMax, _durationMinMax, _frequencyMinMax) {
	if (!instance_exists(ceiling)) exit;
	ceiling.setBumpConfig(_offsetMinMax, _durationMinMax, _frequencyMinMax);
}

function ceiling_setBumpActive(_active) {
	if (!instance_exists(ceiling)) exit;
	ceiling.bumpActive = _active;
}

function GroundBump(
	_distance,
	_duration
) constructor {
	distance = _distance;
	duration = _duration;
	unit = 180 / _duration;
	active = true;
	rot = 0;
	
	function step() {
		if (active) {
			if (rot < 180) rot += unit else active = false;
		}
	}
	
	function getOffset() {
		return abs(lengthdir_y(distance, rot));	
	}
}