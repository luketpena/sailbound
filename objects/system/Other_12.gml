/// @description Generate Island


cameraSystem_update_all();

instance_create_layer(0,0,"l_system",obj_camera_viewer);

instance_create_layer(0,0,"l_system",sys_clock);
instance_create_layer(0,0,"l_system",sys_colors);
instance_create_layer(0,0,"l_system",sys_lighting);
instance_create_layer(0,0,"l_system",sys_particles);

instance_create_layer(0,0,"l_system",sys_water_surface);

instance_create_layer(0,0,"l_background",sys_horizon);

instance_create_layer(0,0,"l_main",sys_drawing);
instance_create_layer(0,0,"l_weather_front",sys_weather);