/// @description Day fade

alarm[1] = 15;

global.clock_fade = fadeRange(global.clock_time,60,20,clock_point_night,clock_point_sunrise,0,1);