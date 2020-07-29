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

function array_shuffle(array) {
	var new_array = [];
	var old_array = array;
	var array_count = array_length(old_array);
	
	do {
		//Choose a random spot in the old array
		var selection = irandom(array_count-1);
		//Add that value to the new array
		new_array[array_length(new_array)] = old_array[selection];
		//And remove the selected value from the old array
		var offset = 0;
		var replace_array = [];
		for (var i=0; i<array_count; i++) {
			if (i=selection) offset = 1 else {
				replace_array[i-offset] = old_array[i];
			}
		}
		old_array = replace_array;
		array_count = array_length(old_array);
	} until (array_count=0);
	
	return new_array;
}