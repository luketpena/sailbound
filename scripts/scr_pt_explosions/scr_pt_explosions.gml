function pt_init_explosion_burst() {
	global.pt_explosion_burst = part_type_create();
	part_type_sprite(global.pt_explosion_burst, spr_fx_particle_burst, 1, 1, 0);
	part_type_size(global.pt_explosion_burst, .5, 1, 0, 0);
	part_type_orientation(global.pt_explosion_burst, 0, 0, 0, 0, 1);
	part_type_color1(global.pt_explosion_burst, c_white);
	part_type_life(global.pt_explosion_burst, 2, 20);
	part_type_speed(global.pt_explosion_burst, 1, 8, 0, 0);
	part_type_direction(global.pt_explosion_burst, 0, 360, 0, 0);
}
