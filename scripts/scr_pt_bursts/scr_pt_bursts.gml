function pt_init_burst_ko() {
	global.pt_burst_ko = part_type_create();
	part_type_sprite(global.pt_burst_ko, spr_fx_particle_burst, 1, 1, 0);
	part_type_size(global.pt_burst_ko, .5, 1, 0, 0);
	part_type_orientation(global.pt_burst_ko, 0, 0, 0, 0, 1);
	part_type_color1(global.pt_burst_ko, c_white);
	part_type_life(global.pt_burst_ko, 10, 30);
	part_type_speed(global.pt_burst_ko, 1, 4, 0, 0);
	part_type_direction(global.pt_burst_ko, 0, 360, 0, 0);
}

function pt_init_burst_chest() {
	global.pt_burst_chest = part_type_create();
	part_type_sprite(global.pt_burst_chest, spr_fx_particle_burst, 1, 1, 0);
	part_type_size(global.pt_burst_chest, .5, 1, 0, 0);
	part_type_orientation(global.pt_burst_chest, 0, 0, 0, 0, 1);
	part_type_color1(global.pt_burst_chest, c_white);
	part_type_life(global.pt_burst_chest, 10, 40);
	part_type_speed(global.pt_burst_chest, 1, 4, 0, 0);
	part_type_direction(global.pt_burst_chest, 20, 160, 0, 0);
}
