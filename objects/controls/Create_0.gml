// Tilt settings
tilt_deadzone = .05;
tilt_maxAngle = .2;
tilt_actual = 0;
tilt_current = 0;
tilt_previous = array_create(15, 0);
tilt_active = false;
tilt_abs = 0;
tilt_strength = 0;
tilt_face = 0;
tilt_clamped = 0;
tilt_slide = 0;

function setCurrent(value) {
	var num = array_length(tilt_previous);
	for (var i=1; i<num; i++) {
		tilt_previous[i] = tilt_previous[i-1];
	}
	tilt_previous[0] = tilt_current;
	tilt_current = value;
	var sum = 0;
	for (var i=0; i<num; i++) {
		sum += tilt_previous[i];
	}
	var target = (sum + tilt_current) / (num + 1);
	tilt_slide += (target - tilt_slide) * .1;
}