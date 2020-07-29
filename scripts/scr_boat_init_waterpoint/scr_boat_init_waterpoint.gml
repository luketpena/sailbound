function boat_init_waterpoint() {
	/*
		This script initializes water point detection for the boat
	*/

	//>>checks
	waterpoint_center = 0;
	waterpoint_front = 0;
	waterpoint_back = 0;
	waterpoint_front_col = false;
	//>>water surface coordinates - front
	waterpoint_o[0] = noone;
	waterpoint_x[0] = 0;
	waterpoint_y[0] = 0;
	//>>water surface coordinates - back
	waterpoint_o[1] = noone;
	waterpoint_x[1] = 0;
	waterpoint_y[1] = 0;


}
