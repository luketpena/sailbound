/// @description Color Blending

alarm[0] = 1;

global.c_sky_space = scr_system_colors_blend(global.clock_time,c_sky_space[0],c_sky_space[1],c_sky_space[2],c_sky_space[3],c_sky_space[4]);
global.c_sky_horizon = scr_system_colors_blend(global.clock_time,c_sky_horizon[0],c_sky_horizon[1],c_sky_horizon[2],c_sky_horizon[3],c_sky_horizon[4]);
global.c_sky_clouds = scr_system_colors_blend(global.clock_time,c_sky_clouds[0],c_sky_clouds[1],c_sky_clouds[2],c_sky_clouds[3],c_sky_clouds[4]);

global.c_water_horizon = scr_system_colors_blend(global.clock_time,c_water_horizon[0],c_water_horizon[1],c_water_horizon[2],c_water_horizon[3],c_water_horizon[4]);
global.c_water_surface = scr_system_colors_blend(global.clock_time,c_water_surface[0],c_water_surface[1],c_water_surface[2],c_water_surface[3],c_water_surface[4]);
global.c_water_depth = scr_system_colors_blend(global.clock_time,c_water_depths[0],c_water_depths[1],c_water_depths[2],c_water_depths[3],c_water_depths[4]);

global.c_front = scr_system_colors_blend(global.clock_time,c_front[0],c_front[1],c_front[2],c_front[3],c_front[4]);