function pt_init_explosion_burst() {
	global.pt_explosion_burst = part_type_create();
	part_type_sprite(global.pt_explosion_burst, spr_fx_particle_burst, 1, 1, 0);
	part_type_size(global.pt_explosion_burst, .5, 1, 0, 0);
	part_type_orientation(global.pt_explosion_burst, 0, 0, 0, 0, 1);
	part_type_color1(global.pt_explosion_burst, c_white);
	part_type_life(global.pt_explosion_burst, 5, 30);
	part_type_speed(global.pt_explosion_burst, 1, 4, 0, 0);
	part_type_direction(global.pt_explosion_burst, 0, 360, 0, 0);
}

function pt_init_explosion_fragment() {
	global.pt_explosion_fragment = part_type_create();
	part_type_life(global.pt_explosion_fragment, 10, 30);
	part_type_alpha3(global.pt_explosion_fragment, 1, .25, 0);
	part_type_orientation(global.pt_explosion_fragment, 0, 360, 0, 0, 0);
	part_type_color3(global.pt_explosion_fragment, c_orange, c_dkorange, c_black);
	part_type_sprite(global.pt_explosion_fragment, spr_fx_particle_swirl, 0, 0, 0);
	part_type_size(global.pt_explosion_fragment, .25, .5, 0, 0);	
}