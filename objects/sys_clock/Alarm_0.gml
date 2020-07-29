/// @description Clock clock_period

alarm[0] = .1*room_speed;

//>>Night to sunrise
if (global.clock_time >= clock_point_sunrise && global.clock_time <= clock_point_morning) global.clock_period = "madrugada"
//>>Sunrise to day
else if (global.clock_time >= clock_point_morning && global.clock_time <= clock_point_day) global.clock_period = "morning"
//>>Day sustained
else if (global.clock_time <= clock_point_sunset || global.clock_time >= clock_point_day) global.clock_period = "day"
//>>Day to sunset
else if (global.clock_time >= clock_point_sunset && global.clock_time <= clock_point_sunfall) global.clock_period = "afternoon"
//>>Sunset to sunfall
else if (global.clock_time >= clock_point_sunfall && global.clock_time <= clock_point_nightfall) global.clock_period = "evening"
//>>Sunfall to night
else if (global.clock_time >= clock_point_nightfall && global.clock_time <= clock_point_night) global.clock_period = "sunset"
//>>Night sustained
else if (global.clock_time <= clock_point_sunrise && global.clock_time >= clock_point_night) global.clock_period = "night";