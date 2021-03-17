// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function vibrate_set_impulse(strength){
	with(sys_vibrate) {
		impulse_str = max(strength,impulse_str);
	}
}

function vibrate_set_sustain(strength, duration) {
	with(sys_vibrate) {
		sustain_str = strength;
		sustain_wait = duration;
	}
}

function dice(chance) {
	return (irandom_range(1,max(1,chance)) = 1);
}

function angleInRange(dir, pointDir, range) {
	return (abs(angle_difference(dir, pointDir)) <= range);
}