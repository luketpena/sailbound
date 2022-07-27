camera_init();
window_set_fullscreen(true);

target = o_town_player;

cam_speed = .1;

focus = noone;
focus_active = false;
focus_num = instance_number(obj_cam_focus);

target_x = target.x - global.hvw;
target_y = target.y - global.hvh;

cam_x = target_x;
cam_y = target_y;

camera_set_view_pos(view_camera[0], cam_x, cam_y);


function snapToTarget(newTarget = null) {
	if (newTarget != null) {
		target = newTarget;	
	}
	cam_x = target_x;
	cam_y = target_y;
	camera_set_view_pos(view_camera[0], cam_x, cam_y);
}

function snapToPlayer() {
	snapToTarget(o_town_player);
}