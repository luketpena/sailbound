if (active) {
	if (font.wave.str > 0) {
		font.wave.rot = (font.wave.rot + font.wave.rate) mod 360;	
	}

	if (closing) {
		if (textPos > 0) {
			textPos = max(0, textPos - 10);	
		}
		
		if (pointer.size > 0) pointer.size -= .1;
	
		if (layout.height < 5) {
			layout.width -= layout.width * .25;	
		}
	
		sphere.active = (layout.width < .5 && layout.height < .5)
		if (sphere.active) {
			if (sphere.size > 0) sphere.size -= .1 else active = false;	
		}
	} else {
		if keyboard_check_pressed(vk_space) next();
		
		if (textPos < translatedLength) {
			textPos ++;
			if dice(3) audio_play_sound(snd_dialog_type, 0, 0);
		} else {
			nextButton.rot = (nextButton.rot + nextButton.rotRate) mod 360;
			if (nextButton.lerpVal < 1) {
				nextButton.lerpVal += .01;
				nextButton.size = ease_lerp(EASE.OutElastic, 0, 1, nextButton.lerpVal);
			}
		}
	}
	
	if instance_exists(pointer.target) {
		setPointerTargetX(pointer.target.x);
	}
	
	pointer.x += (pointer.targetX - pointer.x) * .25;
}

if (wait.active) {
	if (wait.timer > 0) wait.timer-- else {
		wait.active = false;
		layout.width = layout.savedWidth;
		conversationPos++;
		sphere.active = false;
		pointer.size = 1;
		resetFont();
		translateNext();
		resetNextButton();
	
		active = true;
		closing = false;
		audio_play_sound(snd_dialog_open, 0, 0);
	}
}

if (question.active) {
	var q = config[conversationPos].question;
	if (keyboard_check_pressed(vk_down)) {
		select = (select + 1) mod array_length(q);
	}
	if (keyboard_check_pressed(vk_up)) {
		select --
		if (select < 0) select = array_length(q) - 1
	}
}

if (interview.active) {
	var i = interview.list
	if (keyboard_check_pressed(vk_down)) {
		select = (select + 1) mod array_length(i);
	}
	if (keyboard_check_pressed(vk_up)) {
		select --
		if (select < 0) select = array_length(i) - 1
	}
}
