var mouse_pos = mouse_x-global.vx;

if (mouse_pos<64) {
	scroll_tilt = -(1-(mouse_pos/64));
} else if (mouse_pos>global.vw-64) {
	scroll_tilt = (mouse_pos-(global.vw-64))/64;
} else {
	scroll_tilt = 0;
}

var scroll_speed_set = scroll_speed*scroll_tilt;
scroll_speed_current += (scroll_speed_set-scroll_speed_current)*.1;	

camera_set_view_pos(view_camera[0],clamp(global.vx+scroll_speed_current,0,room_width),scroll_y);