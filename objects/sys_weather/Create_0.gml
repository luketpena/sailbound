//---- Targetting ----\\
target = noone;

//---- Weather System ----\\
weather_type = "rain";
weather_active = false;
weather_fade = 0;
weather_fade_rate = .01;
weather_stage = "idle";
weather_surface = noone;

//---- Precipitation ----\\
precip_sprite = noone;
precip_x = 0;
precip_y = 0;
precip_speed_h = 0;
precip_speed_v = 0;

//---- Fog ----\\
fog_surface = noone;
fog_active = false;
fog_fade = 0;
fog_alpha = 0;
fog_position = 0;
fog_speed = .5;
fog_color = c_white;
fog_color_array = [0,0,0];

scr_fog_palette_storm();

u_fog_alpha = shader_get_uniform(shd_fog,"alpha");
u_fog_color = shader_get_uniform(shd_fog,"color");

//---- Dependents ----\\
instance_create_layer(0,0,l_system,sys_weather_back);

intensity = .01;
drop_count_max = 8;
drop_count = drop_count_max;
droplet_end = global.water_y + 32;
Droplet = function(_x, _y, _sprite, _speed, _angle) constructor {
	x = _x;
	y = _y;
	sprite = _sprite;
	angle = _angle;
	angle_offset = random_range(-4, 4);
	str = random_range(.01, .1);
	speed = _speed;
	alpha = random_range(.3,.8);
	scale = random_range(.5, 1.5);
}
droplet_gravity = 3;



alarm[0] = 5;

droplet_list = [];