

function camera_set_vbounce(amplitude, rotation_speed) {
	with(prnt_camera) {
		vbounce_rot = 270;
		if (vbounce_amp=0) {
			vbounce_amp = amplitude;
			vbounce_rot_speed = rotation_speed;
		} else {
			if (amplitude>vbounce_amp) vbounce_amp = amplitude;
			if (rotation_speed>vbounce_rot_speed) vbounce_rot_speed = rotation_speed;
		}
	}
}

function camera_set_shudder(strength) {
	with(prnt_camera) {
		if (strength>shudder_str) {
			shudder_str = strength;	
		}
	}
}

function camera_set_shudder_sustain(strength,duration) {
	with(prnt_camera) {
		shudder_sustain_str = strength;
		shudder_sustain_wait = duration;
	}
}

function camera_set_shove(strength,direction) {
	with(prnt_camera) {
		shove_str = strength;
		shove_dir = direction;
		shove_lerp = 0;
	}
}

function camera_set_twitch(strength,direction) {
	with(prnt_camera) {
		twitch_str = strength;
		twitch_dir = direction;
	}
}