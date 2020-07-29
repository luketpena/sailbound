phy_position_x += lengthdir_x(move_speed,move_dir);
phy_position_y += lengthdir_y(move_speed,move_dir);

if (move_speed>-move_speed_set) {
	if (!returning && move_speed<0) returning = true;
	move_speed -= .1;	
}

if (move_dir>90 && move_dir<270) {
	spin = (spin+spin_speed) mod 360;	
} else {
	spin -= spin_speed;
	if (spin<0) spin += 360;
}