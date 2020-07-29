///@description Sets the goal positions for the textbox
///@param top_or_bottom?
function scr_textbox_set_position_goals(argument0) {

	side = argument0;

	switch(side) {
		case "top":
			top = 8;
			bottom = top+textbox_height;
			break;
		case "bottom":
			bottom = global.vh-8;
			top = bottom-textbox_height;
			break;	
	}

	var center = (left+right)/2;
	var middle = (top+bottom)/2;

	bkg_c = [center, middle];

	bkg_point_g[0] = [left+random_range(-4,4),top+random_range(-4,4)];
	bkg_point_g[1] = [center+random_range(-32,32),top+random_range(-4,4)];
	bkg_point_g[2] = [right+random_range(-4,4),top+random_range(-4,4)];

	bkg_point_g[3] = [right+random_range(-4,4),middle+random_range(-4,4)];

	bkg_point_g[4] = [right+random_range(-2,2),bottom+random_range(-2,2)];
	bkg_point_g[5] = [center+random_range(-32,32),bottom+random_range(-4,4)];
	bkg_point_g[6] = [left+random_range(-4,4),bottom+random_range(-4,4)];

	bkg_point_g[7] = [left+random_range(-4,4),middle+random_range(-4,4)];
}
