phy_position_x = o_boat_main.x_center_draw;
phy_position_y = o_boat_main.y_center_draw;
phy_rotation = -prnt_boat_draw.hull_angle;

if (o_boat_main.falling) {
	if (bounceReady = false) {
		bounceReady = true;	
		bounceReadyTimer = bounceReadyTimerSet;
	}
} else if (bounceReady) {
	if (bounceReadyTimer > 0)
		then bounceReadyTimer--
		else bounceReady = false;
}