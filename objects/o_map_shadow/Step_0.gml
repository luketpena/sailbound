if (target != noone) {
	if (instance_exists(target)) {
		x = target.x;
		y = target.y;
		image_angle = target.image_angle;
		image_index = target.image_index;
	} else {
		instance_destroy();	
	}
}