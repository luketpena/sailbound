/// @description Generate Water

cameraSystem_update_all();

//----< Main Systems >----\\
instance_create_layer(0, 0, l_system, sys_particles);
instance_create_layer(0, 0, l_system, sys_gameplay);
instance_create_layer(0, 0, l_system, sys_vibrate);
instance_create_layer(0, 0, l_system, sys_hud);
instance_create_layer(0, 0, l_system, sys_progress);
instance_create_layer(0, 0, l_system, sys_textbox);
instance_create_layer(0, 0, l_system, touch);
instance_create_layer(0, 0, l_system, controls);
instance_create_layer(0, 0, l_system, itemInventory);
instance_create_layer(0, 0, l_main, sys_drawing);


//----< Environment >----\\
instance_create_layer(0, 0, l_system, sys_glow);
instance_create_layer(0, 0, l_system, sys_horizon);
instance_create_layer(0, 0, l_system, lighting);
instance_create_layer(0, 0, l_system, sys_weather);
instance_create_layer(0, 0, l_system, islands);

//----< Water >----\\
instance_create_layer(0, 0, l_system, sys_water);
instance_create_layer(0, 0, l_system, sys_water_surface);
instance_create_layer(0, 0, l_system, sys_water_front);
instance_create_layer(0, 0, l_system, sys_water_back);
instance_create_layer(0, 0, l_system, sys_water_backdrop);
instance_create_layer(0, 0, l_system, sys_water_distortion);

//----< Final >----\\
instance_create_layer(0, 0, l_system, obj_camera_water);
instance_create_layer(room_width/2, global.water_y, l_main, o_boat_main);
instance_create_layer(room_width/2, global.water_y, l_main, obj_petra);
instance_create_layer(0, 0, l_main, story);

// Settings
global.motion = 1;

//>> Loading
//knapsack.load();