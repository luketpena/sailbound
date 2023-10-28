active = dialog_reader.active;
if (active) {
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
		// TODO: Remove, this happens on the reader
		// if keyboard_check_pressed(vk_space) next();
		
		if (textPos < translatedLength) {
			textPos ++;
			if dice(3) audio_play_sound(snd_dialog_type, 0, 0);
		} else {
			// Animate the next icon (anchor) wobbling
			nextButton.rot = (nextButton.rot + nextButton.rotRate) mod 360;
			if (nextButton.lerpVal < 1) {
				nextButton.lerpVal += .01;
				nextButton.size = ease_lerp(EASE.OutElastic, 0, 1, nextButton.lerpVal);
			}
		}
	}
	
	// Align + animate pointer with target
	// TODO: This feels dumb, let's revisit
	//if instance_exists(pointer.target) {
	//	setPointerTargetX(pointer.target.x);
	//}
	//pointer.x += (pointer.targetX - pointer.x) * .25;
}

