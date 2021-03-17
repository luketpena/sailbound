function boat_step_angleCorrection() {
	if (physics_active) {
		var pwr = 20;
		var correction_angle = -boat_angle_lerp*2;
		var correction = (sqr(correction_angle)*correction_angle)*pwr;
		physics_apply_force(x,y,lengthdir_x(correction,boat_angle_reverse-90),lengthdir_y(correction,boat_angle_reverse-90));
		with(back) {
			physics_apply_force(x,y,lengthdir_x(-correction,boat_angle_reverse-90),lengthdir_y(-correction,boat_angle_reverse-90));
		}
		phy_position_x = clamp(phy_position_x,back.phy_position_x+4,room_width);
	}
}
