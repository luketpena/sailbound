function camera_init(scale = 1) {
	//>>this sets the ratio of the in-game camera size
	var resolution_ratio = "16:9"; //0 = 16:9,  1 = 8:5,  2 = 5:4,  3 = 4:3
	var camera_width,  camera_height;
	switch(resolution_ratio) {
	
		case "16:9":
		default:
			//>>16:9
			camera_width = 512 * scale;
			camera_height = 288 * scale;
		break;
	
		case "8:5":
			//>>8:5
			camera_width = 344;
			camera_height = 215;
		break;
	
		case "5:4":
			//>>5:4
			camera_width = 320;
			camera_height = 256;
		break;
	
		case "4:3":
			//>>4:3
			camera_width = 320 * scale;
			camera_height = 240 * scale;
		break;
	
	}
	
	//>>setting up the camera
	view_camera[0] = camera_create_view(0, 0, camera_width, camera_height, 0, noone, 0, 0, 0, 0);
	//>>parameters
	global.vx = camera_get_view_x(view_camera[0]);
	global.vy = camera_get_view_y(view_camera[0]);
	global.vw = camera_get_view_width(view_camera[0]);
	global.vh = camera_get_view_height(view_camera[0]);
	global.vr = global.vx+global.vw;
	global.vb = global.vy+global.vh;
	global.hvw = global.vw/2;
	global.hvh = global.vh/2;
	global.midx = global.vx+global.vw/2;
	global.midy = global.vx+global.vh/2;
	
	var windowScale = 1;
	var surfaceScale = 4;

	camera_set_view_pos(view_camera[0], 64, 384 - global.hvh);
	//window_set_size(global.vw * windowScale, global.vh * windowScale);
	//surface_resize(application_surface, global.vw * surfaceScale, global.vh * surfaceScale);
	display_set_gui_size(global.vw, global.vh);

}
