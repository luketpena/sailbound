///@description Starts up a new text dialogue
///@param text_queue
function scr_textbox_start(argument0) {

	with(sys_textbox) {
		text_queue = argument0;
		text = string_fit_width(text_queue[0],text_width);
		text_length = string_length(string_hash_to_newline(text));
		text_select = 0;
		text_alpha = 1;
		text_complete = false;
		text_pos = 0;
		active = true;
	
		genie_lerp = 0;
	}

	sys_hud.hud_active = false;


}
