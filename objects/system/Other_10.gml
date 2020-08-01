/// @description Generate Water

cameraSystem_update_all();

//----< Main Systems >----\\
instance_create_layer(0,0,l_system,sys_particles);
instance_create_layer(0,0,l_system,sys_gameplay);
instance_create_layer(0,0,l_system,sys_vibrate);
instance_create_layer(0,0,l_system,sys_map);
instance_create_layer(0,0,l_system,sys_clock);
instance_create_layer(0,0,l_system,sys_hud);
instance_create_layer(0,0,l_system,sys_progress);
instance_create_layer(0,0,l_system,sys_textbox);
instance_create_layer(0,0,l_main,sys_drawing);

//----< Environment >----\\
instance_create_layer(0,0,l_system,sys_colors);
instance_create_layer(0,0,l_system,sys_glow);
instance_create_layer(0,0,l_system,sys_horizon);
instance_create_layer(0,0,l_system,sys_lighting);
instance_create_layer(0,0,l_system,sys_weather);
instance_create_layer(0,0,l_system,sys_islands);

//----< Water >----\\
instance_create_layer(0,0,l_system,sys_water);
instance_create_layer(0,0,l_system,sys_water_surface);
instance_create_layer(0,0,l_system,sys_water_front);
instance_create_layer(0,0,l_system,sys_water_back);
instance_create_layer(0,0,l_system,sys_water_backdrop);
instance_create_layer(0,0,l_system,sys_water_distortion);

//----< Final >----\\
instance_create_layer(0,0,l_system,obj_camera_water);
instance_create_layer(room_width/2,global.water_y,l_main,obj_boat_front);
instance_create_layer(room_width/2,global.water_y,l_main,obj_petra);