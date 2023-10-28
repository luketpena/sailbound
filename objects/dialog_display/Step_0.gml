if (closing) {
	// Subtracts the text quickly
	if (textPos > 0) {
		textPos = max(0, textPos - 10);	
	}
	
	// Shrink the pointer
	if (pointer.size > 0) pointer.size -= .1;
	
	// Shrink the width
	if (layout.height < 5) {
		layout.width -= layout.width * .25;	
	}
	
	// Sphere becomes active when the size is real small
	sphere.active = (layout.width < .5 && layout.height < .5)
	if (sphere.active) {
		if (sphere.size > 0) sphere.size -= .1 else active = false;	
	}
}

if (active) {
	if (text != dialog_reader.text) {
		text = dialog_reader.text;
		
		nextButton.reset();
		if (is_undefined(text)) {
			closing = true;
		} else {
			textPos = 0;
			text_translated = translate(dialog_reader.text);
			translated_length = array_length(text_translated);
		}
	}
	
	// Set the dialog height
	var _dialogHeight = closing ? 0 : calculateDialogHeight();
	layout.height += (_dialogHeight - layout.height) * .15;
	
	// Animating text wave motion
	if (font.wave.str > 0) {
		font.wave.rot = (font.wave.rot + font.wave.rate) mod 360;	
	}

	// Animate closing
	if (closing) {
		// Subtracts text
		if (textPos > 0) {
			textPos = max(0, textPos - 10);	
		}
		
		// Shrinks the speaker pointer
		if (pointer.size > 0) pointer.size -= .1;
		
		// Shrinks height first before width
		if (layout.height < 5) {
			layout.width -= layout.width * .25;	
		}
	
		// "Sphere" is a sprite that represents the last of the bkg shrinking away
		sphere.active = (layout.width < .5 && layout.height < .5)
		if (sphere.active) {
			if (sphere.size > 0) sphere.size -= .1 else active = false;	
		}
		
	} else {
		if (textPos < translated_length) {
			textPos ++;
			if dice(3) audio_play_sound(snd_dialog_type, 0, 0); // Chance to make a sound while "typing"
		} else if (!dialog_reader.response_active) {
			// Animate the next icon (anchor) wobbling
			nextButton.rot = (nextButton.rot + nextButton.rotRate) mod 360;
			if (nextButton.lerpVal < 1) {
				nextButton.lerpVal += .01;
				nextButton.size = ease_lerp(EASE.OutElastic, 0, 1, nextButton.lerpVal);
			}
		}
	}
	
	// Input controls
	if keyboard_check_pressed(vk_space) {
		// Skip to end of text OR toggle next text
		if (textPos < translated_length) {
			textPos = translated_length;		
		} else {
			dialog_reader.node_next();
		}
	}

	if keyboard_check_pressed(vk_down) {
		dialog_reader.response_next();	
	}

	if keyboard_check_pressed(vk_up) {
		dialog_reader.response_previous();	
	}
} else {
	active = dialog_reader.active;
	// If activating, reset all the layout-visual stuff
	if (active) {
		closing = false;
		sphere.active = false;
		layout.width = layout.savedWidth;
	}
}