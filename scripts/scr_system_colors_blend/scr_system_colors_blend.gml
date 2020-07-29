///@description Blends through multiple colors depending on position in loop
///@param pos The position in the loop
///@param cSunrise 1
///@param cDay 2
///@param cSunset 3
///@param cSunfall 4
///@param cNight 5
function scr_system_colors_blend(argument0, argument1, argument2, argument3, argument4, argument5) {

	var blend, fColor;
	fColor = c_white; //final color

	//>>Night to sunrise
	if (argument0 >= clock_point_sunrise && argument0 < clock_point_morning) {
		blend = (argument0-clock_point_sunrise)/(clock_point_morning-clock_point_sunrise)
			fColor = merge_colour(argument5,argument1,blend);
	}

	//>>Sunrise to day
	if (argument0 >= clock_point_morning && argument0 < clock_point_day) {
		blend = (argument0-clock_point_morning)/(clock_point_day-clock_point_morning)
			fColor = merge_colour(argument1,argument2,blend);		
	}

	//>>Day sustained
	if (argument0 < clock_point_sunset || argument0 >= clock_point_day) {
		fColor = argument2;
	}

	//>>Day to sunset
	if (argument0 >= clock_point_sunset && argument0 < clock_point_sunfall) {
		blend = (argument0-clock_point_sunset)/(clock_point_sunfall-clock_point_sunset)
			fColor = merge_colour(argument2,argument3,blend);
	}

	//>>Sunset to sunfall
	if (argument0 >= clock_point_sunfall && argument0 < clock_point_nightfall) {
		blend = (global.clock_time-clock_point_sunfall)/(clock_point_nightfall-clock_point_sunfall)
			fColor = merge_colour(argument3,argument4,blend);
	}

	//>>Sunfall to night
	if (argument0 >= clock_point_nightfall && argument0 < clock_point_night) {
		blend = (argument0-clock_point_nightfall)/(clock_point_night-clock_point_nightfall)
			fColor = merge_colour(argument4,argument5,blend);
	}

	//>>Night sustained
	if (argument0 < clock_point_sunrise && argument0 >= clock_point_night) {
		fColor = argument5;
	}

	return make_color_hsv(color_get_hue(fColor),color_get_saturation(fColor)*global.color_sat,color_get_value(fColor)*global.color_val);



}
