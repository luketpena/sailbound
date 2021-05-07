// sky = {space, horizon, clouds}
// water = {horizon, surface, depths}
// front = front

/*
	All palettes are made of swatches, with a full palette consisting of 
*/

///@description A swatch is the full day of colors for a single channel
///@param morningColor
///@param dayColor
///@param sunsetColor
///@param sunfallColor
///@param nightColor
function Swatch(_morning, _day, _sunset, _sunfall, _night) constructor {
	morning = _morning;
	day = _day;
	sunset = _sunset;
	sunfall = _sunfall;
	night = _night;
	array = [morning, day, sunset, sunfall, night];
}


///@description Creates the full palette for all environmental elements
///@param skyPalette
///@param waterPalette
///@param frontSwatch
function Palette(_sky, _water, _front) constructor {
	sky = _sky;
	water = _water;
	front = _front;
}

///@description Creates the palette for the sky elements
///@param spaceSwatch
///@param horizonSwatch
///@param cloudsSwatch
///@param sunSwatch
///@param moonColor
function PaletteSky(_space, _horizon, _clouds, _sun, _moon) constructor {
	space = _space;
	horizon = _horizon;
	clouds = _clouds;
	sun = _sun;
	moon = _moon;
}

///@description Creates the palette for the water elements
///@param horizonSwatch
///@param surfaceSwatch
///@param depthsSwatch
///@param highlightSwatch
function PaletteWater(_horizon, _surface, _depths, _highlight) constructor {
	horizon = _horizon;
	surface = _surface;
	depths = _depths;
	highlight = _highlight;
}