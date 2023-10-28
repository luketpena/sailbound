// -- HANDLE RESIZE --
// This has to be updated live (lazy way) because gpMode might change at any points
gpMode = true; // TODO: revert this back to being response to input.type
width = string_width(text);
textX = margin;

if (gpMode) {
	width += 20;	
	textX += 20;
}

image_xscale = (width / 32);

// -- HANDLE TRIGGERING --
hold.step();
if (hold.triggered) {
	onClick();	
}

// -- HANDLE HOVER AND CLICK --


if (hover && mouse_check_button_pressed(mb_left)) {
	onClick();	
}