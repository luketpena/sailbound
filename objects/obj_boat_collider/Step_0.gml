phy_position_x = obj_boat_front.x_center_draw;
phy_position_y = obj_boat_front.y_center_draw;
phy_rotation = -prnt_boat_draw.hull_angle;

if (obj_boat_front.falling) {
	if (bounceReady = false) {
		bounceReady = true;	
		bounceReadyTimer = bounceReadyTimerSet;
	}
} else if (bounceReady) {
	if (bounceReadyTimer > 0)
		then bounceReadyTimer--
		else bounceReady = false;
}