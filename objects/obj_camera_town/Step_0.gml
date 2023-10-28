if (!focus_active) {
	
	target_x = target.x - global.hvw;
	target_y = target.y - 48 - global.hvh;
	
	for (var i=0; i<focus_num; i++) {
		var o = instance_find(obj_cam_focus, i);
		if (point_distance(o.x, o.y, target.x, target.y) < o.focus_dis) {
			focus = o;
			focus_active = true;	
			cam_speed = .05;
			break;
		}
	}
} else {
	
	var focus_dis_current = point_distance(focus.x, focus.y, target.x, target.y);
	var cam_dir = point_direction(focus.x, focus.y, target.x, target.y);
	var cam_len = focus_dis_current/2;
	
	target_x = focus.x - global.hvw + lengthdir_x(cam_len, cam_dir);
	target_y = focus.y - global.hvh + lengthdir_y(cam_len, cam_dir);
	
	if (focus_dis_current > focus.focus_dis+16) {
		focus = noone;
		focus_active = false;
		cam_speed = .1;
	}
}

cam_x += (target_x - cam_x) * .05;
cam_y += (target_y - cam_y) * .05;

camera_set_view_pos(view_camera[0], floor(cam_x), floor(cam_y));

global.vx = camera_get_view_x(view_camera[0]);
global.vy = camera_get_view_y(view_camera[0]);
global.vr = global.vx + global.vw;
global.vb = global.vy + global.vh;
global.midx = global.vx + global.vw/2;
global.midy = global.vy + global.vh/2;