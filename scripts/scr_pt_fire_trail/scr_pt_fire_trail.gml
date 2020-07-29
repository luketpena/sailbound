function pt_init_fire_trail() {
	global.pt_fire_trail = part_type_create();
	part_type_sprite(global.pt_fire_trail, spr_fx_particle_puff,1,1,0);
	part_type_orientation(global.pt_fire_trail, 0, 360, 0, 0, 0);
	part_type_color3(global.pt_fire_trail, c_yellow, c_dkorange, c_realred);
	part_type_life(global.pt_fire_trail, 5, 20);
	part_type_speed(global.pt_fire_trail, 0, 0.10, 0, 0);
	part_type_direction(global.pt_fire_trail, 0, 360, 0, 0);


}
