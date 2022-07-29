if (instance_exists(sys_sky)) {
	global.horizon_y = y - (y - global.midy) * .7;
	sys_sky.init();
}