old_sky_space = [];
old_sky_horizon = [];
old_sky_clouds = [];
old_sun = [];
old_moon = [];
old_water_surface_lt = [];
old_water_horizon = [];
old_water_surface = [];
old_water_depths = [];
old_front = [];

array_copy(old_sky_space, 0, sys_colors.c_sky_space, 0, 5);
array_copy(old_sky_horizon, 0, sys_colors.c_sky_horizon, 0, 5);
array_copy(old_sky_clouds, 0, sys_colors.c_sky_clouds, 0, 5);
array_copy(old_sun, 0, sys_colors.c_sun, 0, 5);
array_copy(old_moon, 0, sys_colors.c_moon, 0, 5);
array_copy(old_water_surface_lt, 0, sys_colors.c_water_surface_lt, 0, 5);
array_copy(old_water_surface, 0, sys_colors.c_water_surface, 0, 5);
array_copy(old_water_depths, 0, sys_colors.c_water_depths, 0, 5);
array_copy(old_water_horizon, 0, sys_colors.c_water_horizon, 0, 5);
array_copy(old_front, 0, sys_colors.c_front, 0, 5);

scr_palette_ocean();

transition_speed = 0;
transition_point = 0;
active = false;
