function clock_set_points() {
	clock_point_sunrise = 250; //Sunrise
	clock_point_morning = 270; //Morning
	clock_point_day = 290; //Day
	clock_point_sunset = 90; //Sunset
	clock_point_sunfall = 110; //Sunfall
	clock_point_nightfall = 130; //Nightfall
	clock_point_night = 150; //Night
}

function clock_start() {
	if (instance_exists(sys_clock)) {
		sys_clock.clock_active = true;
	}
}

function clock_stop() {
	if (instance_exists(sys_clock)) {
		sys_clock.clock_active = false;
	}
}