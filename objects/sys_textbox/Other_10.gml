///@description Go to next

var text_end = array_length_1d(text_queue);
text_select++;

if (text_select<text_end) {
	text = string_fit_width(text_queue[text_select],text_width);
	text_length = string_length(string_hash_to_newline(text));
	scr_textbox_set_positions(choose("top","bottom"));
	text_complete = false;
	text_pos = 0;

	nextButton_lerp = 0;
	nextButton_size = 0;
} else {
	scr_textbox_set_position_goals(side);
	active = false;	
}