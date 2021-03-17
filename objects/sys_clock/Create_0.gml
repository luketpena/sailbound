global.clock_time = 0; //Rotates around to 360.
global.clock_fade = 0;
global.clock_period = "morning";

clock_active = false;
clock_elapsed = 275;
clock_day = 0;

var dayDurationInMinutes = 10;
clock_speed = ((360 / 60) / 60) / dayDurationInMinutes;

//Points are used to mark locations where the time of day changes state.
clock_set_points();

alarm[0] = 1;
alarm[1] = 1;