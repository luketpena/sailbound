if (keyboard_check_pressed(vk_left)) {
	prev();	
}

if (keyboard_check_pressed(vk_right)) {
	next();	
}

if (slideIndex != selectIndex) {
	slideIndex += (selectIndex - slideIndex) * .1;
}