///@description Fits a string into a certain width by inserting hashes
///@param string
///@param width
function string_fit_width(argument0, argument1) {

	var text = argument0;
	var max_width = argument1;
	var last_space = 0;

	draw_set_font(global.font_normal_small);
	for (var i=0; i<string_length(text); i++) {
		var copy = string_copy(string_upper(string_hash_to_newline(text)),0,i);
		var width = string_width(copy);
		if (string_char_at(text,i)=" ") then last_space = i;
		if (width>max_width) {
			text = string_delete(text,last_space,1);
			text = string_insert("#",text,last_space);
		}
	}

	return string_hash_to_newline(text);
}
