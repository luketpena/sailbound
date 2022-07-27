var angle = image_angle - 90,
	xx = x + lengthdir_x(16, angle),
	yy = y + lengthdir_y(16, angle);

physics_apply_force(xx, yy, 0, 3);