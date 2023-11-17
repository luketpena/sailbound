///@description Blends through multiple colors depending on position in loop
///@param position
///@param colorArray
function blendSwatch(_colorArray) {
	var _finalColor = getColorArrayBlend(_colorArray);
		
	return make_color_hsv(
		color_get_hue(_finalColor),
		color_get_saturation(_finalColor) * colors.saturation,
		color_get_value(_finalColor) * colors.value
	);
}

// Blends colors in the palette across the day
function getColorArrayBlend(_colorArray) {
	// Handling single-color palettes
	if (array_length(_colorArray) == 1) {
		return _colorArray[0];	
	}
	return merge_color(
		_colorArray[currentColorPoint],
		_colorArray[nextColorPoint],
		colorBlendAmmount
	);	
}

function mergeColorArrays(_array1, _array2, _ammount) {
	// Handle colors that palette 2 ignores
	if (array_length(_array2) == 0) {
		var _color = getColorArrayBlend(_array1);
		return make_color_hsv(
			color_get_hue(_color),
			color_get_saturation(_color) * colors.saturation,
			color_get_value(_color) * colors.value
		);	
	}
	
	// If both have some colors to blend, then blend them
	var _color1 = getColorArrayBlend(_array1);
	var _color2 = getColorArrayBlend(_array2);
	
	var _merged = merge_color(_color1, _color2, _ammount);
	
	return make_color_hsv(
		color_get_hue(_merged),
		color_get_saturation(_merged) * colors.saturation,
		color_get_value(_merged) * colors.value
	);
}

function snapToPalette(_prev, _next) {
	return {
		sky: {
			space: snapToSwatch(_prev.sky.space, _next.sky.space),
			horizon: snapToSwatch(_prev.sky.horizon, _next.sky.horizon),
			clouds: snapToSwatch(_prev.sky.clouds, _next.sky.clouds),
			sun: snapToSwatch(_prev.sky.sun, _next.sky.sun),
			moon: (_next.sky.moon == undefined) ? _prev.sky.moon : _next.sky.moon
		},
		water: {
			horizon: snapToSwatch(_prev.water.horizon, _next.water.horizon),
			surface: snapToSwatch(_prev.water.surface, _next.water.surface),
			depths: snapToSwatch(_prev.water.depths, _next.water.depths),
			highlight: snapToSwatch(_prev.water.highlight, _next.water.highlight),
		},
		front: snapToSwatch(_prev.front, _next.front),
	}
}

function snapToSwatch(_prev, _next) {
	return (array_length(_next) == 0) ? _prev : _next;
}