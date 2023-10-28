depth = -100000;

elevation = 64;
offset_x = - (o_map_camera.xstep * elevation) * o_map_camera.image_zscale;
offset_y = - (o_map_camera.ystep * elevation) * o_map_camera.image_zscale;
wind_dir = random(360);
wind_strength_min = .01;
wind_strength_max = .25;
surf = -1;
alpha = .5;

size = global.vw * 2;

var _cloudCount = ((room_width / 128) * (room_height / 128)) / 4;
repeat(_cloudCount) {
	instance_create_layer(random(room_width), random(room_height), "l_clouds", o_map_env_cloud);	
}