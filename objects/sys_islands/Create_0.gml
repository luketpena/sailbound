islandWait = new MinMax(0, 0);
islandWait_start = null;
islandWait_end = null;
//Island Shader
u_color = shader_get_uniform(shd_fadeColor,"color"); //To what color does it fade?
u_pwr = shader_get_uniform(shd_fadeColor,"pwr"); //How far does it fade to that color?

//This array tracks the islands and is used to draw them in order
island_list = [];
island_speed = [-1, -3];

islandType = null;

active = false;

function updateIslandSettings(chapter) {
	islandType = chapter.islandType;
	if (chapter.islandType = null) {
		active = false;	
		islandAlarm_stop();
	} else {
		if (chapter.islandWait_start != null) {
			islandWait = chapter.islandWait_start;
		}
		islandWait_start = chapter.islandWait_start;
		islandWait_end = chapter.islandWait_end;
		islandAlarm_set();
	}
}

function islandAlarm_set() {
	alarm[0] = random_range(islandWait[0], islandWait[1]);	
}

function islandAlarm_stop() {
	alarm[0] = -1;
	test();
}
	
updateIslandSettings(getFirstChapter());