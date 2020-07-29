if (global.clock_time>clock_point_nightfall && global.clock_time<clock_point_morning) {
	glow_alpha = fadeRange(global.clock_time,20,20,clock_point_night,clock_point_sunrise,0,1);
}