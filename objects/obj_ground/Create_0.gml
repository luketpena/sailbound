thickness = 0;
wait = 0;
state = "enter";
active = false;
move_speed = 1;
top = 0;
q = 8;
unit_w = room_width/8;
tex_w = 1/8;
tex_offset = 0;

surf = -1; //used for the texture
top_height = 48;
top_upper = top_height*.5;
top_lower = top_height-top_upper;

draw_top = 0;
draw_low = 0;

function init(target_y) {
	//Fills up all space from target y downward
	thickness = (room_height-target_y)/2;
	top = target_y;
	draw_top = top-top_upper;
	draw_low = top+top_lower;
	//Generates the physics structure
	fixture_create_box(id,room_width/2,thickness,0,0,0,0,.2,false,true);
	//Sets the position based on the goal position
	phy_position_y = target_y+thickness;
	//Activate!
	active = true;
}
