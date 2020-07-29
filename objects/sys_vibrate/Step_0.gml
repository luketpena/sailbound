var vibrate_str = 0;

if (impulse_str>0) {
	vibrate_str = max(vibrate_str,impulse_str);
	impulse_str -= .05;
}

if (sustain_str>0) {
	vibrate_str = max(vibrate_str,sustain_str);
}
if (sustain_wait>-1) {
	if (sustain_wait>0) sustain_wait-- else {
		if (sustain_str>0) sustain_str -= .01 else {
			sustain_str = 0;
			sustain_wait = -1;
		}
	}
}

gamepad_set_vibration(0,vibrate_str,vibrate_str);