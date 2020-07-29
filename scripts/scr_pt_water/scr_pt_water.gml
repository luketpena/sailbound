function pt_init_water_wave_wake() {
	pt_water_wave_wake = part_type_create();
	part_type_shape(pt_water_wave_wake, pt_shape_pixel);
	part_type_sprite(pt_water_wave_wake, spr_fx_particle_puff, 1, 1, 0);
	part_type_size(pt_water_wave_wake, .5, 1, 0, 0);
	part_type_scale(pt_water_wave_wake, 1, .7);
	part_type_color1(pt_water_wave_wake, c_white);
	part_type_life(pt_water_wave_wake, 5, 40);
	part_type_speed(pt_water_wave_wake, 0, -0.50, 0, 0);
}

function pt_init_water_splash() {
	global.pt_water_splash = part_type_create();
	part_type_sprite(global.pt_water_splash, spr_fx_particle_puff, 1, 1, 0);
	part_type_size(global.pt_water_splash, .7, 1, 0, 0);
	part_type_orientation(global.pt_water_splash, 0, 360, 0, 0, 0);
	part_type_life(global.pt_water_splash, 5, 30);
	part_type_speed(global.pt_water_splash, 0, 1, 0, 0);
	part_type_direction(global.pt_water_splash, 85, 95, 0, 0);
	part_type_gravity(global.pt_water_splash, 0.02, 270);
}

function pt_init_water_wake_surface() {
	global.pt_water_wake_surface = part_type_create();
	part_type_sprite(global.pt_water_wake_surface, spr_fx_particle_puff_out, 1, 1, 0);
	part_type_size(global.pt_water_wake_surface, .5, 1, 0, 0);
	part_type_life(global.pt_water_wake_surface, 10, 100);
	part_type_speed(global.pt_water_wake_surface, 0, 1, 0, 0);
	part_type_direction(global.pt_water_wake_surface, 180, 180, 0, 0);
}

function pt_init_water_wake_splash() {
	global.pt_water_wake_splash = part_type_create();
	part_type_sprite(global.pt_water_wake_splash, spr_fx_particle_puff, 1, 1, 0);
	part_type_size(global.pt_water_wake_splash, 1, 1, 0, 0);
	part_type_orientation(global.pt_water_wake_splash, 0, 360, 0, 0, 0);
	part_type_life(global.pt_water_wake_splash, 10, 60);
	part_type_speed(global.pt_water_wake_splash, 0.250, .5, 0, 0);
	part_type_direction(global.pt_water_wake_splash, 160, 130, 0, 0);
	part_type_gravity(global.pt_water_wake_splash, 0.01, 230);
}

function pt_init_water_front_current() {
	pt_water_front_current = part_type_create();
	part_type_sprite(pt_water_front_current, spr_pixel, 0, 0, 0);
	part_type_size(pt_water_front_current, 1, 1, 0, 0);
	part_type_scale(pt_water_front_current, 1, 1);
	part_type_alpha3(pt_water_front_current, 0, 1, 0);
	part_type_life(pt_water_front_current, 20, 150);
	part_type_speed(pt_water_front_current, 0.10, 1, 0, 0);
	part_type_direction(pt_water_front_current, 180, 180, 0, 2);
}

function pt_init_water_bubble() {
	global.pt_water_bubble = part_type_create();
	part_type_sprite(global.pt_water_bubble, spr_pixel, 0, 0, 1);
	part_type_color1(global.pt_water_bubble, c_white);
	part_type_alpha3(global.pt_water_bubble, 0,.5,0);
	part_type_life(global.pt_water_bubble, 20, 80);
	part_type_orientation(global.pt_water_bubble,0,360,0,0,0);
	part_type_speed(global.pt_water_bubble, 0, 0.10, 0, 0.10);
	part_type_direction(global.pt_water_bubble, 0, 360, 0, 2);
	part_type_gravity(global.pt_water_bubble, 0.001, 90);
}

//jumpSplash_main
function pt_init_water_jump_main() {
	pt_water_jump_main = part_type_create();
	part_type_sprite(pt_water_jump_main, spr_fx_particle_puff, 1, 1, 0);
	part_type_size(pt_water_jump_main, 1, 1, 0, 0);
	part_type_scale(pt_water_jump_main, 1, 1);
	part_type_orientation(pt_water_jump_main, 0, 360, 0, 0, 0);
	part_type_color1(pt_water_jump_main, c_white);
	part_type_alpha1(pt_water_jump_main, 1);
	part_type_life(pt_water_jump_main, 5, 40);
	part_type_speed(pt_water_jump_main, 0, .5, 0, 0);
	part_type_direction(pt_water_jump_main, 90, 90, 0, 0);
	part_type_gravity(pt_water_jump_main, 0.01, 270);
}

//jumpSplash_point
function pt_init_water_jump_point() {
	pt_water_jump_point = part_type_create();
	part_type_sprite(pt_water_jump_main, spr_fx_particle_puff, 1, 1, 0);
	part_type_size(pt_water_jump_point, 1, 1, 0, 0);
	part_type_scale(pt_water_jump_point, 1, 1);
	part_type_orientation(pt_water_jump_point, 0, 360, 0, 0, 0);
	part_type_color1(pt_water_jump_point, c_white);
	part_type_alpha3(pt_water_jump_point, 1,.7,.5);
	part_type_life(pt_water_jump_point, 5, 50);
	part_type_speed(pt_water_jump_point, 1, 1.5, 0, 0);
	part_type_direction(pt_water_jump_point, 90, 90, 0, 0);
	part_type_gravity(pt_water_jump_point, 0.03, 270);
}