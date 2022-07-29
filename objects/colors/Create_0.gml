// Main controls
saturation = 1;
value = 1;

// Palettes
palette = palette_tropical();
palette_prev = null;
palette_next = null;
palette_transition_time = -1; // The countdown timer
palette_transition_set = 0; // The time that the timer is counting from
transitioning = false;

// The clock points determine where on the clock it transitions to from color to color
global.clockPoints = [
	0, .1, .4, .45, .5, .6, .9, 1
];

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
	var myPalette = script_execute(_nextPalette);
	palette_transition_set = _duration * room_speed;
	palette_transition_time = 0;
	
	palette_prev = palette;
	palette_next = myPalette;
	transitioning = true;
}

///@description Snaps the colors to a given palette
///@param palette
function set(_palette) {
	palette = script_execute(_palette);	
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
	return {
		sky: {
			space: swatch_blend(clock.time, _palette.sky.space.array),
			horizon: swatch_blend(clock.time, _palette.sky.horizon.array),
			clouds: swatch_blend(clock.time, _palette.sky.clouds.array),
			sun: swatch_blend(clock.time, _palette.sky.sun.array),
			moon: _palette.sky.moon,
		
			space_vec3: color_to_vec3(sky.space),
			horizon_vec3: color_to_vec3(sky.horizon),
			clouds_vec3: color_to_vec3(sky.clouds),
		},
		water: {
			horizon: swatch_blend(clock.time, _palette.water.horizon.array),
			surface: swatch_blend(clock.time, _palette.water.surface.array),
			depths: swatch_blend(clock.time, _palette.water.depths.array),
			highlight: swatch_blend(clock.time, _palette.water.highlight.array),
		
			horizon_vec3: color_to_vec3(water.horizon),
			surface_vec3: color_to_vec3(water.surface),
			depths_vec3: color_to_vec3(water.depths),
			highlight_vec3: color_to_vec3(water.highlight),
		},
		front: swatch_blend(clock.time, _palette.front.array),
	}
}

function setPalette() {
	var currentColors = setColors(palette);
	sky = currentColors.sky;
	water = currentColors.water;
	front = currentColors.front;	
	front_vec3 = color_to_vec3(front);
}

function transitionPalette(lerpVal) {
	var prevPalette = setColors(palette_prev),
		nextPalette = setColors(palette_next),
		
	
	var skyTransition = {
		space: merge_color(prevPalette.sky.space, nextPalette.sky.space, lerpVal),
		horizon: merge_color(prevPalette.sky.horizon, nextPalette.sky.horizon, lerpVal),
		clouds: merge_color(prevPalette.sky.clouds, nextPalette.sky.clouds, lerpVal),
	}
	
	sky = {
		space: skyTransition.space,
		horizon: skyTransition.horizon,
		clouds: skyTransition.clouds,
		sun: merge_color(prevPalette.sky.sun, nextPalette.sky.sun, lerpVal),
		moon: merge_color(prevPalette.sky.moon, nextPalette.sky.moon, lerpVal),
	
		space_vec3: color_to_vec3(skyTransition.space),
		horizon_vec3: color_to_vec3(skyTransition.horizon),
		clouds_vec3: color_to_vec3(skyTransition.clouds),
	}
	
	var waterTransition = {
		horizon: merge_color(prevPalette.water.horizon, nextPalette.water.horizon, lerpVal),
		surface: merge_color(prevPalette.water.surface, nextPalette.water.surface, lerpVal),
		depths: merge_color(prevPalette.water.depths, nextPalette.water.depths, lerpVal),
		highlight: merge_color(prevPalette.water.highlight, nextPalette.water.highlight, lerpVal),	
	}

	water = {
		horizon: waterTransition.horizon,
		surface: waterTransition.surface,
		depths: waterTransition.depths,
		highlight: waterTransition.highlight,
	
		horizon_vec3: color_to_vec3(waterTransition.horizon),
		surface_vec3: color_to_vec3(waterTransition.surface),
		depths_vec3: color_to_vec3(waterTransition.depths),
		highlight_vec3: color_to_vec3(waterTransition.highlight),
	}
}
