for (var i=0; i<5; i++) {
	old_sky_space[i] = sys_colors.c_sky_space[i];
	old_sky_horizon[i] = sys_colors.c_sky_horizon[i];
	old_sky_clouds[i] = sys_colors.c_sky_clouds[i];
	
	old_water_horizon[i] = sys_colors.c_water_horizon[i];
	old_water_surface[i] = sys_colors.c_water_surface[i];
	old_water_depths[i] = sys_colors.c_water_depths[i];
	
	old_front[i] = sys_colors.c_front[i];
}

scr_palette_ocean();

transition_speed = 0;
active = false;
value = 0;