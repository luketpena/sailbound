alarm[0] = 120;
light_create(x,y,spr_fx_flare_300,0,1,1,c_orange,1,-1,.05);
image_angle = random(360);

Puff = function(_x, _y, _dir) constructor {
	dir = _dir;
	angle = random(360);
	speed = random_range(1,4);
	x = _x;
	y = _y;
	alpha = 1;
	fade = random_range(.03, .05);
	flip = choose(-1, 1);
	rot = random_range(.25,1);
	color_fade = 0;
	color_fade_rate = random_range(.05, .1);
	color = merge_color(c_orange, $111122, 0);
	anim = 0;
}

puff_list = [];
puffNum = 16;
for (var i=0; i<puffNum; i++) {
	puff_list[i] = 	new Puff(x, y, (360/puffNum) * i);
}

part_particles_create(global.ps_fx_glow,x,y,global.pt_explosion_burst,16);

circle_active = 4;
circle_radius = 32;

belowWater = false;
var water_y = water_find_y_basic(x);
var water_dis = abs(water_y-y);
if (y > water_y) {
	belowWater = true
	if (water_dis<12) water_splash_create_double(x, 32, "large");
	else if (water_dis<24) water_splash_create_double(x, 32, "medium");
	else if (water_dis<36) water_splash_create_double(x, 32, "small");
} else {
	alarm[1] = 4;
	if (water_dis<12) water_splash_create_double(x, 48, "large");
	else if (water_dis<24) water_splash_create_double(x, 48, "medium");
}

if (water_dis<24) instance_create_layer(x, y, l_main, obj_explosion_ripple);
