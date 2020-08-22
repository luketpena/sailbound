///@description Converts a color into a vec3 of its RGB values
///@param color
function color_to_vec3(argument0) {
	return [color_get_red(argument0)/255,color_get_green(argument0)/255,color_get_blue(argument0)/255];
}
