if (motion < 180) {
	motion++;
	value = -lengthdir_y(1, motion);
	progress = motion / 180;
} else {
	instance_destroy();	
}