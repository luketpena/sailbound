function boat_step_positions() {
	if (floating) bob_sin += bob_spd;
	//>> Boat Front
	draw_y_front += (round(y)-draw_y_front)/2;
	draw_y_back += (round(back.y)-draw_y_back)/2;
	//>> Boat Center
	x_center = x+lengthdir_x(boat_width/2,boat_angle_reverse);
	y_center = draw_y_front+lengthdir_y(bob_dis,bob_sin)+lengthdir_y(boat_width/2,boat_angle_reverse);
	//>> Draw Center
	x_center_draw += (x_center-x_center_draw)/2;
	y_center_draw += (y_center-y_center_draw)/2;
	//>> Sail Center
	sail_x = x_center_draw+lengthdir_x(8,boat_angle_reverse+180);
	sail_y = y_center_draw+lengthdir_y(8,boat_angle_reverse+180);
	//>> Lantern Hook Position
	//lHook.phy_position_x = x_center_draw+lengthdir_x(32,boat_angle+13);
	//lHook.phy_position_y = y_center_draw+lengthdir_y(32,boat_angle+13);

	//---- Boat Center ----\\
	center.phy_position_x = x_center_draw+lengthdir_x(6,boat_angle-90);
	center.phy_position_y = y_center_draw+lengthdir_y(6,boat_angle-90);
	center.phy_rotation = -boat_angle;


}
