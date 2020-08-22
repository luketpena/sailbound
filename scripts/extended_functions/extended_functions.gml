
//Provides an array containing containing both the x and y lengthdir for a give len and dir
function lengthdir(length,direction){
	return [
		lengthdir_x(length,direction),
		lengthdir_y(length,direction)
	];
}

//Fades up to a point, plateaus at the point, and translates to a number range in the output
function fadeRange(value, threshold_low, threshold_high, plateau_low, plateau_high, output_min, output_max) {

	var limit_high = threshold_high+plateau_high;
	var limit_low = threshold_low-plateau_low;

	//Check for values beyond the fade range
	if (value>limit_high || value<limit_low ) then return output_min;
	//Check for values within the plateau
	if (value>=plateau_low && value<=plateau_high) then return output_max;

	var lerpValue;
	//Fade to point from values below and above the plateau
	if (value<=limit_high && value>=plateau_high) then lerpValue = (threshold_high-(value-plateau_high) ) / threshold_high; //fading to top
	if (value>=limit_low  && value<=plateau_low)  then lerpValue = (value-(plateau_low-threshold_low) ) / threshold_low; //fading to bottom
	
	return lerp(output_min,output_max,lerpValue);
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
	if (font) draw_set_font(font);
	if (color) draw_set_color(color);
	if (halign) draw_set_halign(halign);
	if (valign) draw_set_valign(valign);
	if (alpha>0) draw_set_alpha(alpha);
}

function draw_text_color1(x,y,str,color,alpha) {
	draw_text_color(x,y,str,color,color,color,color,alpha);	
}

function draw_text_color1_ext(x,y,str,sep,width,color,alpha) {
	draw_text_ext_color(x,y,str,sep,width,color,color,color,color,alpha);	
}

//Draws all objects with a tag
function draw_tag(tag) {
	var collection = tag_get_asset_ids(tag,asset_object);
	for (var i=0; i<array_length(collection); i++) {
		with(collection[i]) event_perform(ev_draw,0);
	}
}

function drawBegin_tag(tag) {
	var collection = tag_get_asset_ids(tag,asset_object);
	for (var i=0; i<array_length(collection); i++) {
		with(collection[i]) event_perform(ev_draw_begin,0);
	}
}

//Triggers the draw for an object
function draw_object(object) {
	with(object) event_perform(ev_draw,0);	
}

function free_surface(surf) {
	if surface_exists(surf) surface_free(surf);	
}