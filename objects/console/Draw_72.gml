function cleanup(string) {
	return string_hash_to_newline(string_upper(string));	
}

if surface_exists(surf) {
	if (text_to_add!="") {
		if (text_to_add=text_previous) {
			text_to_add = "";
			c_log("Messages was a copy!");
		} else {
			surface_set_target(surf);
				draw_clear_alpha(c_black,.5);
			
				var newString = text_to_write + "#" + text_to_add;
				newString = string_fit_width(newString, global.vw-32);
			
				draw_set_font(global.font_normal_small);
				draw_set_color(c_white);
				draw_set_alpha(1);
				draw_set_valign(fa_bottom);
			
				while(string_height(newString)>height) {
					var stringLength = string_length(newString);
					newString = cleanup(string_copy(newString,1,stringLength-2));
				} 
			
				text_previous = text_to_add;
				text_to_add = "";
				text_to_write = cleanup(newString);
			
				//draw_text(16,height-8,text_to_write);
			surface_reset_target();	
		}
	}
} else {
	surf = surface_create(global.vw,height);
	surface_set_target(surf);
		draw_clear_alpha(c_black,.5);
	surface_reset_target();
}