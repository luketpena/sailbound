///@description Manages colors and palette transitions

// Main controls
saturation = 1;
value = 1;

// Palettes
palette = palette_tropical3();
palette_prev = null;
palette_next = null;
palette_transition_time = -1; // The countdown timer
palette_transition_set = 0; // The time that the timer is counting from
isSingleColorPalette = false;
transitioning = false;

currentClockPoint = 0;
nextColorPoint = 0;
currentColorPoint = 0;
colorBlendAmmount = 0;

// The clock points determine where on the clock it transitions to from color to color
global.clockPoints = [
	0, .1, .4, .45, .5, .6, .9, 1
];
clockPointCount = array_length(global.clockPoints);

// These color points coincide with what transitions happen for each clockPoint
global.colorPoints = [
	0, 1, 1, 2, 3, 4, 4, 0
];

///@description Transitions to a new palette over time
///@param palette
///@param duration
function transition(
	_nextPalette,
	_duration
) {
	var _myPalette = _nextPalette();
	palette_transition_set = _duration;
	palette_transition_time = 0;
	
	palette_prev = palette;
	palette_next = _myPalette;
	transitioning = true;
}

///@description Snaps the colors to a given palette
///@param palette
function setPalette(_palette) {
	palette = script_execute(_palette);
	isSingleColorPalette = array_length(palette.front) == 1;
}

// Current sky colors
sky = {
	space: $ffffff,
	horizon: $fffff,
	clouds: $fffff,
	sun: $ffffff,
	moon: $ffffff,
	
	space_vec3: $ffffff,
	horizon_vec3: $ffffff,
	clouds_vec3: $ffffff,
}

// Current water colors
water = {
	horizon: $ffffff,
	surface: $ffffff,
	depths: $ffffff,
	highlight: $ffffff,
	
	horizon_vec3: $ffffff,
	surface_vec3: $ffffff,
	depths_vec3: $ffffff,
	highlight_vec3: $ffffff,
}

function setColors(_palette) {
	if (isSingleColorPalette) {
		return {
			sky: {
				space: _palette.sky.space[0],
				horizon: _palette.sky.horizon[0],
				clouds: _palette.sky.clouds[0],
				sun: _palette.sky.sun[0],
				moon: _palette.sky.moon,
		
				space_vec3: color_to_vec3(sky.space),
				horizon_vec3: color_to_vec3(sky.horizon),
				clouds_vec3: color_to_vec3(sky.clouds),
			},
			water: {
				horizon: _palette.water.horizon[0],
				surface: _palette.water.surface[0],
				depths: _palette.water.depths[0],
				highlight: _palette.water.highlight[0],
		
				horizon_vec3: color_to_vec3(water.horizon),
				surface_vec3: color_to_vec3(water.surface),
				depths_vec3: color_to_vec3(water.depths),
				highlight_vec3: color_to_vec3(water.highlight),
			},
			front: _palette.front[0],
		}
	}
	
	return {
		sky: {
			space: blendSwatch(_palette.sky.space),
			horizon: blendSwatch(_palette.sky.horizon),
			clouds: blendSwatch(_palette.sky.clouds),
			sun: blendSwatch(_palette.sky.sun),
			moon: _palette.sky.moon,
		
			space_vec3: color_to_vec3(sky.space),
			horizon_vec3: color_to_vec3(sky.horizon),
			clouds_vec3: color_to_vec3(sky.clouds),
		},
		water: {
			horizon: blendSwatch(_palette.water.horizon),
			surface: blendSwatch(_palette.water.surface),
			depths: blendSwatch(_palette.water.depths),
			highlight: blendSwatch(_palette.water.highlight),
		
			horizon_vec3: color_to_vec3(water.horizon),
			surface_vec3: color_to_vec3(water.surface),
			depths_vec3: color_to_vec3(water.depths),
			highlight_vec3: color_to_vec3(water.highlight),
		},
		front: blendSwatch(_palette.front),
	}
}

function setColorsFromPalette() {
	var currentColors = setColors(palette);
	sky = currentColors.sky;
	water = currentColors.water;
	front = currentColors.front;	
	front_vec3 = color_to_vec3(front);
}


function blendPalettes(_lerpVal) {	
	front = mergeColorArrays(palette_prev.front, palette_next.front, _lerpVal);
	
	var _skyTransition = {
		space: mergeColorArrays(palette_prev.sky.space, palette_next.sky.space, _lerpVal),
		horizon: mergeColorArrays(palette_prev.sky.horizon, palette_next.sky.horizon, _lerpVal),
		clouds: mergeColorArrays(palette_prev.sky.clouds, palette_next.sky.clouds, _lerpVal),
	}
	
	sky = {
		space: _skyTransition.space,
		horizon: _skyTransition.horizon,
		clouds: _skyTransition.clouds,
		sun: mergeColorArrays(palette_prev.sky.sun, palette_next.sky.sun, _lerpVal),
		moon: (palette_next.sky.moon == undefined) ? palette_prev.sky.moon : merge_color(palette_prev.sky.moon, palette_next.sky.moon, _lerpVal),
	
		space_vec3: color_to_vec3(_skyTransition.space),
		horizon_vec3: color_to_vec3(_skyTransition.horizon),
		clouds_vec3: color_to_vec3(_skyTransition.clouds),
	}
	
	var _waterTransition = {
		horizon: mergeColorArrays(palette_prev.water.horizon, palette_next.water.horizon, _lerpVal),
		surface: mergeColorArrays(palette_prev.water.surface, palette_next.water.surface, _lerpVal),
		depths: mergeColorArrays(palette_prev.water.depths, palette_next.water.depths, _lerpVal),
		highlight: mergeColorArrays(palette_prev.water.highlight, palette_next.water.highlight, _lerpVal),	
	}

	water = {
		horizon: _waterTransition.horizon,
		surface: _waterTransition.surface,
		depths: _waterTransition.depths,
		highlight: _waterTransition.highlight,
	
		horizon_vec3: color_to_vec3(_waterTransition.horizon),
		surface_vec3: color_to_vec3(_waterTransition.surface),
		depths_vec3: color_to_vec3(_waterTransition.depths),
		highlight_vec3: color_to_vec3(_waterTransition.highlight),
	}
}
