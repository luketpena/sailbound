function boat_step_angle() {
	/*
		Sets the angle of the boat for both front and back
	*/
	boat_angle = point_direction(back.x,draw_y_back,x,draw_y_front);
	boat_angle_reverse = point_direction(x,draw_y_front,back.x,draw_y_back);

	boat_angle_lerp = (boat_angle_reverse-180)/90

	back.boat_angle = boat_angle;
	back.boat_angle_reverse = boat_angle_reverse;


}
