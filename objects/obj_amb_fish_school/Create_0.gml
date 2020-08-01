active = false;
face = 1;

target_x = x;
target_y = y;

fish_num = 16;
fish_list = [];

turn_min = .01;
turn_max = .1;

move_speed = .6;

//>> Color Blending
color = color_to_vec3(global.c_water_depth);
alarm[0] = 15;
u_horizon_col = shader_get_uniform(shd_island,"horizon_col"); //To what color does it fade?
u_pwr = shader_get_uniform(shd_island,"pwr"); //How far does it fade to that color?

Fish = function(_x,_y,_fade) constructor {
	x = _x;
	y = _y;
	angle = random(360);
	speed = random_range(1,1.25);
	speed_flux_angle = random(360);
	speed_flux_rate = random_range(5,8);
	speed_flux_influence = random_range(.1,.2);
	
	dir_flux_angle = random(360);
	dir_flux_rate = random_range(2,10);
	dir_flux_power = random_range(5,20);
	
	target_offset_x = random_range(-16,16);
	target_offset_y = random_range(-16,16);
	
	turn_flux_angle = random(360);
	turn_flux_rate = random_range(2,8);
	
	shd_power = lerp(0,.5,_fade);
	flip = 0;
}

function init() {
	active = true;
	if (x<room_hwidth) face = 1 else face = -1;
	for (var i=0; i<fish_num; i++) {
		var newFish = new Fish(x+random_range(-16,16),y+random_range(-16,16), i/fish_num);
		fish_list[i] = newFish;
	}
}