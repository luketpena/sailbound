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


function string_split(text, delimiter) {
	var startIndex = 1;
	var array = [];
	var length = string_length(text);
	for (var i=1; i<=length; i++) {
		var char = string_char_at(text, i);
		
		if (char = delimiter) {
			if (i - startIndex > 0) {
				var count = i - startIndex;
				var subString = string_copy(text, startIndex, count);
				array_push(array, subString);
			}
			startIndex = i + 1;
		}
		
		if (i = length) {
			var count = i - startIndex + 1;
			var subString = string_copy(text, startIndex, count );
			array_push(array, subString);
		}
	}
	return array;
}