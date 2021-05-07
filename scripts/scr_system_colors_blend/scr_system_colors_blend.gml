///@description Blends through multiple colors depending on position in loop
///@param pos The position in the loop
///@param cSunrise 1
///@param cDay 2
///@param cSunset 3
///@param cSunfall 4
///@param cNight 5
//function scr_system_colors_blend(argument0,  argument1,  argument2,  argument3,  argument4,  argument5) {

//	var blend,  finalColor;
//	finalColor = c_white; //final color

//	//>>Night to sunrise
//	if (argument0 >= clock_point_sunrise && argument0 < clock_point_morning) {
//		blend = (argument0-clock_point_sunrise)/(clock_point_morning-clock_point_sunrise)
//			finalColor = merge_colour(argument5, argument1, blend);
//	}

//	//>>Sunrise to day
//	if (argument0 >= clock_point_morning && argument0 < clock_point_day) {
//		blend = (argument0-clock_point_morning)/(clock_point_day-clock_point_morning)
//			finalColor = merge_colour(argument1, argument2, blend);		
//	}

//	//>>Day sustained
//	if (argument0 < clock_point_sunset || argument0 >= clock_point_day) {
//		finalColor = argument2;
//	}

//	//>>Day to sunset
//	if (argument0 >= clock_point_sunset && argument0 < clock_point_sunfall) {
//		blend = (argument0-clock_point_sunset)/(clock_point_sunfall-clock_point_sunset)
//			finalColor = merge_colour(argument2, argument3, blend);
//	}

//	//>>Sunset to sunfall
//	if (argument0 >= clock_point_sunfall && argument0 < clock_point_nightfall) {
//		blend = (global.clock_time-clock_point_sunfall)/(clock_point_nightfall-clock_point_sunfall)
//			finalColor = merge_colour(argument3, argument4, blend);
//	}

//	//>>Sunfall to night
//	if (argument0 >= clock_point_nightfall && argument0 < clock_point_night) {
//		blend = (argument0-clock_point_nightfall)/(clock_point_night-clock_point_nightfall)
//			finalColor = merge_colour(argument4, argument5, blend);
//	}

//	//>>Night sustained
//	if (argument0 < clock_point_sunrise && argument0 >= clock_point_night) {
//		finalColor = argument5;
//	}

//	return make_color_hsv(color_get_hue(finalColor), color_get_saturation(finalColor)*c_saturation, color_get_value(finalColor)*c_value);
//}

///@description Blends through multiple colors depending on position in loop
///@param position
///@param colorSwatchArray
function swatch_blend(_position,  _colorSwatchArray) {

	var blend,  finalColor;
	finalColor = c_white; //final color

	//>>Night to sunrise
	if (_position >= clock_point_sunrise && _position < clock_point_morning) {
		blend = (_position-clock_point_sunrise)/(clock_point_morning-clock_point_sunrise)
			finalColor = merge_colour(_colorSwatchArray[4], _colorSwatchArray[0], blend);
	}

	//>>Sunrise to day
	if (_position >= clock_point_morning && _position < clock_point_day) {
		blend = (_position-clock_point_morning)/(clock_point_day-clock_point_morning)
			finalColor = merge_colour(_colorSwatchArray[0], _colorSwatchArray[1], blend);		
	}

	//>>Day sustained
	if (_position < clock_point_sunset || _position >= clock_point_day) {
		finalColor = _colorSwatchArray[1];
	}

	//>>Day to sunset
	if (_position >= clock_point_sunset && _position < clock_point_sunfall) {
		blend = (_position-clock_point_sunset)/(clock_point_sunfall-clock_point_sunset)
			finalColor = merge_colour(_colorSwatchArray[1], _colorSwatchArray[2], blend);
	}

	//>>Sunset to sunfall
	if (_position >= clock_point_sunfall && _position < clock_point_nightfall) {
		blend = (global.clock_time-clock_point_sunfall)/(clock_point_nightfall-clock_point_sunfall)
			finalColor = merge_colour(_colorSwatchArray[2], _colorSwatchArray[3], blend);
	}

	//>>Sunfall to night
	if (_position >= clock_point_nightfall && _position < clock_point_night) {
		blend = (_position-clock_point_nightfall)/(clock_point_night-clock_point_nightfall)
			finalColor = merge_colour(_colorSwatchArray[3], _colorSwatchArray[4], blend);
	}

	//>>Night sustained
	if (_position < clock_point_sunrise && _position >= clock_point_night) {
		finalColor = _colorSwatchArray[4];
	}

	return make_color_hsv(
		color_get_hue(finalColor),
		color_get_saturation(finalColor)*c_saturation,
		color_get_value(finalColor)*c_value);
}

