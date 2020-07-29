camera_set_y = global.water_y-global.hvh;
camera_set_x = global.vx;
camera_y = camera_set_y;
camera_x = camera_set_x;
camera_sensor_distance = 128;
camera_displace_distance = 64;

vbounce_rot = 0;
vbounce_rot_speed = 0;
vbounce_amp = 0;

shudder_wait = 0;
shudder_pos = [0,0];
shudder_str = 0;
shudder_angle = 0;
shudder_sustain_str = 0;
shudder_sustain_wait = -1;

shove_str = 0;
shove_dir = 0;
shove_lerp = 1;
shove_pos = [0,0];
shove_ac = animcurve_get_channel(ac_cameraShove,0);

twitch_str = 0;
twitch_dir = 0;