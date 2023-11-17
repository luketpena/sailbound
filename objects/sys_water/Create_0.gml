/*
	Calculates water positions and generates waves.
	Draws the waves that go in front of the scene objects.
*/

//-- SURFACE TEXTURE --\\
water_surface = noone;
global.water_texture = noone;

front_surface = noone;
global.cutout_top_surface = noone;
cutout_bottom_surface = noone;

//-- WATER GLOBALS --\\
global.water_speed = 1; //the speed at which floating objects move

//-- Particles --\\
pt_init_water_wave_wake();

//-- GENERAL --\\
water_width = 12; //How far apart each water segment is
water_num = round(room_width/water_width);
water_halfNum = round(water_num/2);
water_stage = 0;
water_angle = 240; //How far the water tilts inward for perspective

water_alpha_mid = .9; //The alpha at the middle point in the water
water_alpha_low = .7; //THe alpha at the bottom edge of the water

//-- SETTINGS --\\
water_spread = .25; //how much a pillar can pull on its neighbor
water_gravity = .4; //gravity
water_terminal = 2; //terminal velocity
water_fall_dis = 32; //the height divider for the fall rate
water_fall_rate = .8; //multiplier for fall rate

//-- WAVE VARIABLES --\\
waveConfig = {
	active: true,
	count: 5,
	cycle: 0,
	minPower: -2,
	maxPower: -8,
	minSpeed: -2,
	maxSpeed: -6,
	timer: 0,
	minTimer: 1 * room_speed,
	maxTimer: 3 * room_speed, 
}

//wave_sys_active = true;
//wave_num = 5; //the number of possible simultaneous waves
//wave_cycle = 0; //which wave number is being activated next
//wave_pwr_min = -2;
//wave_pwr_max = -8;
//wave_speed_min = -2;
//wave_speed_max = -6;
//wave_wait = 0;
//wave_wait_max = 1 * room_speed;
//wave_wait_min = 3 * room_speed;


var texture_unit = 1/water_num;


//PILLARS
var i; for(i=0; i<=water_num; i++) {
	water_point_active[i] = false;
	water_point_x[i] = water_width*i;
	water_point_y[i] = global.water_y; //Follows water_point_y_track
	water_point_y_track[i] = global.water_y; //Moves on water_step; for interpolation only
	water_point_vel[i] = 0;
	water_point_dis[i] = 0;
	water_point_lDeltas[i] = 0;
	
	var perspective_offset = get_perspective(water_point_x[i]);
	
	water_texture_x[i] = texture_unit*i;
	water_draw_x_top[i] = water_point_x[i]-perspective_offset;
	water_draw_x_low[i] = water_point_x[i]+perspective_offset;
}

// Wave settings
function Wave() constructor {
	active = false;
	point = 0;
	strength = random_range(0, 0);
	x = room_width;
	drawX = 0;
	speed = 0;
}

waveList = [];
for (i=0; i<waveConfig.count; i++) {
	array_push(waveList, new Wave());
}
