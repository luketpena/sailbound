var axisH = gamepad_axis_value(0, gp_axisrh);
var rotateAmount = axisH;

//if (rotateAmount = 0) {
//	var rotateLeft = input_check("mapRotateLeft") ? 1 : 0;
//	var rotateRight = input_check("mapRotateRight") ? -1 : 0;
//	rotateAmount = rotateLeft + rotateRight;
//}

if (rotateAmount > 0) {
	if (cameraAngleSpeed < cameraAngleSpeedMax) cameraAngleSpeed += .1 * rotateAmount;	
} else if (rotateAmount < 0) {
	if (cameraAngleSpeed > -cameraAngleSpeedMax) cameraAngleSpeed += .1 * rotateAmount;	
} else {
	cameraAngleSpeed *= .96;	
}

camera_set_view_angle(view_camera[0], camera_get_view_angle(view_camera[0]) + cameraAngleSpeed);	

// TUTORIAL STUFF
image_zscale += gamepad_axis_value(0, gp_axisrv) * .1;
image_zscale = clamp(image_zscale, zscale_min, zscale_max);
zscale_lerp = get_progress(image_zscale, zscale_min, zscale_max);
billboard_yscale = power(image_zscale / zscale_min, 1);

var _new_height = global.vh * image_zscale;
var _new_x = o_map_player.x - global.hvw;
var _new_y = o_map_player.y - (_new_height / 2);

if (instance_exists(o_map_player)) {
	camera_set_view_pos(view_camera[0], _new_x, _new_y);
	camera_set_view_size(view_camera[0], global.vw, _new_height);
}

global.camAngle = camera_get_view_angle(view_camera[0]) + 90;
xstep = dcos(global.camAngle);
ystep = dsin(global.camAngle);

global.vr = global.vx+global.vw;
global.vb = global.vy+global.vh;
global.midx = global.vx+global.vw/2;
global.midy = global.vy+global.vh/2;

