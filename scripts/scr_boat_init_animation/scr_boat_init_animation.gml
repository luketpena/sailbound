function boat_init_animation() {
	/*
		Start up everything for the boat related to drawing, animation, and art in general.
	*/
	//>> Basics
	boat_angle = 0;
	boat_angle_reverse = 180;
	boat_angle_lerp = 0;

	//>> Bobbing Movement
	bob_dis = 1;
	bob_sin = 0;
	bob_spd = 4;

	//>> Center Coordinates
	x_center = x+lengthdir_x(boat_width/2,boat_angle_reverse);
	y_center = y+lengthdir_y(boat_width/2,boat_angle_reverse);
	//>> Draw Positions
	x_center_draw = x_center;
	y_center_draw = y_center;
	draw_y_front = y;
	draw_y_back = back.y;
	//phy_rotation
	phy_rotation = -boat_angle-90
	//lamp
	//var dir = point_direction(x,draw_y_front,back.x,draw_y_back);
	//lHook = instance_create_layer(x_center_draw+lengthdir_x(32,dir+13),y_center_draw+lengthdir_y(32,dir+13),"l_main",obj_lantern_hook);
	

}
