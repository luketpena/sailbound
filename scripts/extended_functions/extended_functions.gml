
//Provides an array containing containing both the x and y lengthdir for a give len and dir
function lengthdir(length, direction){
	return [
		lengthdir_x(length, direction),
		lengthdir_y(length, direction)
	];
}

//Fades up to a point, plateaus at the point, and translates to a number range in the output
function fadeRange(value, threshold_low, threshold_high, plateau_low, plateau_high, output_min, output_max) {

	var limit_high = plateau_high + threshold_high;
	var limit_low = plateau_low - threshold_low;
	
	//Check for values beyond the fade range
	if (value > limit_high || value < limit_low) then return output_min;
	//Check for values within the plateau
	if (value >= plateau_low && value <= plateau_high) then return output_max;

	var lerpValue;
	//Fade to point from values below and above the plateau
	if (value <= limit_high && value >= plateau_high) then lerpValue = (threshold_high - (value - plateau_high) ) / threshold_high; //fading to top
	if (value >= limit_low  && value <= plateau_low)  then lerpValue = (value - (plateau_low - threshold_low) ) / threshold_low; //fading to bottom
	
	return lerp(output_min, output_max, lerpValue);
}

//This can be used to grow or return a value in response to some truthy value
function grow(growTruthVal, targetVal, minVal, maxVal, rateInc, rateDec) {
	if (growTruthVal) {
		if (targetVal<maxVal) return targetVal+rateInc else return targetVal;
	} else {
		if (targetVal>minVal) return targetVal-rateDec else return targetVal;	
	}
}

//Sets all of the value typically needed for drawing text
function draw_set_style(font,color,halign,valign,alpha) {
	draw_set_font(font);
	draw_set_color(color);
	draw_set_halign(halign);
	draw_set_valign(valign);
	draw_set_alpha(alpha);
}

function draw_text_color1(x,y,str,color,alpha) {
	draw_text_color(x,y,str,color,color,color,color,alpha);	
}

function draw_text_color1_ext(x,y,str,sep,width,color,alpha) {
	draw_text_ext_color(x,y,str,sep,width,color,color,color,color,alpha);	
}

//Draws all objects with a tag
function draw_tag(tag) {
	var objectList = tag_get_asset_ids(tag, asset_object);
	
	if (array_length(objectList)>0) {
		for (var i=0; i<array_length(objectList); i++) {
			var instanceNumber = instance_number(objectList[i])
			for (var j=0; j<instanceNumber; j++) {
				var o = instance_find(objectList[i], j);
				with(o) event_perform(ev_draw,0);
			}		
		}
	}
	
}

function drawBegin_tag(tag) {
	var collection = tag_get_asset_ids(tag, asset_object);
	for (var i=0; i<array_length(collection); i++) {
		with(collection[i]) event_perform(ev_draw_begin,0);
	}
}

//Triggers the draw for an object
function draw_object(object) {
	with(object) event_perform(ev_draw, 0);	
}

// Only trigger if the surface exists
function free_surface(surf) {
	if surface_exists(surf) surface_free(surf);	
}

// Allows you to pick between two values without boilerplate code
function compare(pickFirst, value1, value2) {
	if (pickFirst) return value1 else return value2;	
}

// Gives you the value to iterate between two points over a duration
function getIncrement(durationInSeconds, targetValue = 1) {
	return targetValue / (durationInSeconds * room_speed);
}

// Simplifies the long ass name the original method has.
function hasProperty(struct, propertyName) {
	return variable_struct_exists(struct, propertyName);	
}

function instance_destroy_safe(object = null) {
	if (object = null) instance_destroy() else {
		if instance_exists(object) instance_destroy(object);
	}
}

// Fully stops all physics motion
function phy_speed_stop() {
	phy_speed_x = 0;
	phy_speed_y = 0;
}

function seconds(_value) {
	return _value * game_get_speed(gamespeed_fps);	
}

function minutes(_value) {
	return seconds(_value * 60);
}