if (active) {
	if (!global.ko) {
		// Follow the player
		floatMove_move_point(boat.x_center_draw, boat.y_center_draw);	
	} else {
		// Exit the screen to the left
		floatMove_move_point(-100, global.water_y - 128);
	}
	floatMove_apply();
} else {
	if (global.level_progress >= levelPercent) {
		activate();	
	}
}