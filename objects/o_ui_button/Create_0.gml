hover = false;
width = 0;
textX = 0;
margin = 8;
bgScale = 1 / sprite_get_width(s_ui_button_bkg);
gpMode = false;
hold = new HoldToInteract(gp_button, "ui", "select");

image_xscale = (width / 32);
image_yscale = (height / 32);

switch(align_mode) {
	case "free":
		x = offset_x - (width / 2) - margin;
		y = offset_y - (height / 2)
		break;
	case "edge":
		x =
			(align_horizontal == "left") ? (margin + offset_x) : (
				(align_horizontal == "right") ? (global.vw - width - margin + offset_x) :
				(global.hvw - (width / 2) + offset_x)
			);
	
		y = 
			(align_vertical == "top") ? (margin + offset_y) : (
				(align_vertical == "bottom") ? (global.vh - height - margin + offset_y) :
				(global.hvh - (height / 2) + offset_y)
			);
		break;
}


function onClick() {
	sysLog("Default button click event triggered, please supply a unique click event.");
}