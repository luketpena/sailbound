///@description Blends through multiple colors depending on position in loop


///@param position
///@param colorSwatchArray
function swatch_blend(_position,  _colorSwatchArray) {
	var finalColor = c_white,
		clockPointCount = array_length(global.clockPoints);

	for (var i = 0; i < clockPointCount-1; i++) {
		// All other points point to themselves and the previous value
		var points = [
			global.clockPoints[i],
			global.clockPoints[i+1]
		];
		if (clock.time < points[1]) {
			var colorPoints = [
				global.colorPoints[i],
				global.colorPoints[i+1]
			];
			
			var blend = (clock.time-points[0]) / (points[1]-points[0])
			finalColor = merge_colour(_colorSwatchArray[colorPoints[0]], _colorSwatchArray[colorPoints[1]], blend);
			break;
		}
	
	}
	
	

	////>>Night to sunrise
	//if (_position >= ClockPoint.Sunrise && _position < ClockPoint.Morning) {
	//	blend = (_position-ClockPoint.Sunrise) / (ClockPoint.Morning-ClockPoint.Sunrise)
	//	finalColor = merge_colour(_colorSwatchArray[4], _colorSwatchArray[0], blend);
	//}

	////>>Sunrise to day
	//if (_position >= ClockPoint.Morning && _position < ClockPoint.Day) {
	//	blend = (_position-ClockPoint.Morning) / (ClockPoint.Day-ClockPoint.Morning)
	//	finalColor = merge_colour(_colorSwatchArray[0], _colorSwatchArray[1], blend);		
	//}

	////>>Day sustained
	//if (_position < ClockPoint.Sunset || _position >= ClockPoint.Day) {
	//	finalColor = _colorSwatchArray[1];
	//}

	////>>Day to sunset
	//if (_position >= ClockPoint.Sunset && _position < ClockPoint.Sunfall) {
	//	blend = (_position-ClockPoint.Sunset) / (ClockPoint.Sunfall-ClockPoint.Sunset)
	//	finalColor = merge_colour(_colorSwatchArray[1], _colorSwatchArray[2], blend);
	//}

	////>>Sunset to sunfall
	//if (_position >= ClockPoint.Sunfall && _position < ClockPoint.Nightfall) {
	//	blend = (clock.time-ClockPoint.Sunfall) / (ClockPoint.Nightfall-ClockPoint.Sunfall)
	//	finalColor = merge_colour(_colorSwatchArray[2], _colorSwatchArray[3], blend);
	//}

	////>>Sunfall to night
	//if (_position >= ClockPoint.Nightfall && _position < ClockPoint.Night) {
	//	blend = (_position-ClockPoint.Nightfall) / (ClockPoint.Night-ClockPoint.Nightfall)
	//	finalColor = merge_colour(_colorSwatchArray[3], _colorSwatchArray[4], blend);
	//}

	////>>Night sustained
	//if (_position < ClockPoint.Sunrise && _position >= ClockPoint.Night) {
	//	finalColor = _colorSwatchArray[4];
	//}

	return make_color_hsv(
		color_get_hue(finalColor),
		color_get_saturation(finalColor)*c_saturation,
		color_get_value(finalColor)*c_value);
}

