if (active) {
	if (value<1) value += transition_speed else instance_destroy();
	
	sys_colors.c_moon[0] = merge_color(old_moon[0],c_moon[0],value);

	
	for (var i=0; i<5; i++) {
		sys_colors.c_sky_space[i] = merge_color(old_sky_space[i],c_sky_space[i],value);
		sys_colors.c_sky_horizon[i] = merge_color(old_sky_horizon[i],c_sky_horizon[i],value);
		sys_colors.c_sky_clouds[i] = merge_color(old_sky_clouds[i],c_sky_clouds[i],value);
		
		if (i<3) sys_colors.c_sun[i] = merge_color(old_sun[i],c_sun[i],value);
		
		sys_colors.c_water_surface_lt[i] = merge_color(old_water_surface_lt[i],c_water_surface_lt[i],value);
		sys_colors.c_water_horizon[i] = merge_color(old_water_horizon[i],c_water_horizon[i],value);
		sys_colors.c_water_surface[i] = merge_color(old_water_surface[i],c_water_surface[i],value);
		sys_colors.c_water_depths[i] = merge_color(old_water_depths[i],c_water_depths[i],value);
		
		sys_colors.c_front[i] = merge_color(old_front[i],c_front[i],value);
	}
}