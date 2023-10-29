islandWait = new MinMax(0, 0);
islandWait_saved = new MinMax(0, 0); // transitions from
islandWait_target = new MinMax(0, 0); // transitions to
islandWait_transition = false;

//Island Shader
u_color = shader_get_uniform(shd_fadeColor,"color"); //To what color does it fade?
u_pwr = shader_get_uniform(shd_fadeColor,"pwr"); //How far does it fade to that color?

//This array tracks the islands and is used to draw them in order
island_list = [];
island_speed = [-.1, -.5];
islandType = null;

active = false;

function update(chapter) {
	// Set island min and max times
	var hasMinTransition = false;
	if (variable_struct_exists(chapter, "islandWaitMin")) {
		if (is_array(chapter.islandWaitMin)) {
			islandWait_saved.min = chapter.islandWaitMin[0];
			islandWait_target.min = chapter.islandWaitMin[1];
			hasMinTransition = true;
		} else {
			islandWait.min = chapter.islandWaitMin;	
		}
	}
	var hasMaxTransition = false;
	if (variable_struct_exists(chapter, "islandWaitMax")) {
		if (is_array(chapter.islandWaitMin)) {
			islandWait_saved.max = chapter.islandWaitMax[0];
			islandWait_target.max = chapter.islandWaitMax[1];
			hasMaxTransition = true;
		} else {
			islandWait.max = chapter.islandWaitMax;	
		}
	}
	islandWait_transition = (hasMinTransition || hasMaxTransition);
	
	// Active / inactive toggle
	if (variable_struct_exists(chapter, "islandActive")) {
		active = chapter.islandActive;
		if (active) {
			islandAlarm_set();	
		} else {
			islandAlarm_stop();
		}
	}
	// Island type change
	if (variable_struct_exists(chapter, "islandType")) {
		islandType = chapter.islandType;
	}
}

function islandAlarm_set() {
	alarm[0] = random_range(islandWait.min * room_speed, islandWait.max * room_speed);	
}

function islandAlarm_stop() {
	alarm[0] = -1;
}