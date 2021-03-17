tilt_actual = device_get_tilt_y();
tilt_clamped = clamp(tilt_actual, -tilt_maxAngle, tilt_maxAngle);
tilt_abs = abs(tilt_clamped);
tilt_active = (tilt_abs > tilt_deadzone);
tilt_strength =  (tilt_abs - tilt_deadzone) / (tilt_maxAngle - tilt_deadzone);

if (tilt_active) {
	if (tilt_actual > 0) then tilt_face = 1 else tilt_face = -1;
	setCurrent(tilt_strength * tilt_face);
} else {
	setCurrent(0)
}

