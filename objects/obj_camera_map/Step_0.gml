global.vr = global.vx+global.vw;
global.vb = global.vy+global.vh;
global.midx = global.vx+global.vw/2;
global.midy = global.vy+global.vh/2;

global.camAngle = camera_get_view_angle(view_camera[0]) + 90;

var axisH = gamepad_axis_value(0, gp_axislh);
var axisV = gamepad_axis_value(0, gp_axislv);
var axisRH = gamepad_axis_value(0, gp_axisrh);

global.vx += axisH * 2;
global.vy += axisV * 2;

if (instance_exists(obj_map_playerIcon)) {
	camera_set_view_pos(view_camera[0], obj_map_playerIcon.x - global.hvw, obj_map_playerIcon.y - global.hvh);
}

if (axisRH > 0) {
	if (cameraAngleSpeed < cameraAngleSpeedMax) cameraAngleSpeed += .1 * axisRH;	
} else if (axisRH < 0) {
	if (cameraAngleSpeed > -cameraAngleSpeedMax) cameraAngleSpeed += .1 * axisRH;	
} else {
	cameraAngleSpeed *= .96;	
}

camera_set_view_angle(view_camera[0], camera_get_view_angle(view_camera[0]) + cameraAngleSpeed);	
