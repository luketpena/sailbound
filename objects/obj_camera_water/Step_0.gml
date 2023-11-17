var boat_adjust = (o_boat_main.y_center_draw-global.water_y)/camera_sensor_distance;
var camera_adjust_x = camera_set_x;
var camera_adjust_y = camera_set_y+boat_adjust*camera_displace_distance;

if (vbounce_amp>0) {
	vbounce_rot = (vbounce_rot+vbounce_rot_speed) mod 360;
	vbounce_amp -= .5;
	camera_adjust_y += lengthdir_y(vbounce_amp,vbounce_rot);
}

if (shudder_sustain_wait>-1) {
	if (shudder_sustain_wait>0) shudder_sustain_wait-- else {
		if (shudder_sustain_str>1) shudder_sustain_str *= .9 else {
			shudder_sustain_str = 0;
			shudder_sustain_wait = -1;
		}
	}
}

if (shudder_str>0) shudder_str -= .5;

var shudder_current = max(shudder_str,shudder_sustain_str);
if (shudder_current>0) {
	if (shudder_wait>0) shudder_wait-- else {
		shudder_wait = 2;
		shudder_angle = (shudder_angle+random_range(90,270)) mod 360;
	}
	shudder_pos = lengthdir(shudder_current,shudder_angle);
	camera_adjust_x += shudder_pos[0];
	camera_adjust_y += shudder_pos[1];
}



if (shove_lerp<1) {
	shove_lerp += .025;
	var shove_length = shove_str*animcurve_channel_evaluate(shove_ac,shove_lerp);
	shove_pos = lengthdir(shove_length,shove_dir);
	camera_adjust_x += clamp(shove_pos[0],-32,32);
	camera_adjust_y += shove_pos[1];
}

if (twitch_str>0) {
	var twitch_pos = lengthdir(twitch_str,twitch_dir);
	camera_adjust_x += twitch_pos[0];
	camera_adjust_y += twitch_pos[1];	
	twitch_str *= .5;
}

camera_y += (camera_adjust_y-camera_y)*.25;
camera_x += (camera_adjust_x-camera_x)*.25;

camera_set_view_pos(view_camera[0],round(camera_x),round(camera_y));