///@description Converts a color into a vec3 of its RGB values
///@param color
function color_to_vec3(color) {
	return [
		color_get_red(color) / 255,
		color_get_green(color) / 255,
		color_get_blue(color) / 255
	];
}
