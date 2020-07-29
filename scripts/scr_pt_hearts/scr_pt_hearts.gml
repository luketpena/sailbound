function pt_init_hearts() {
	global.pt_hearts = part_type_create();
	part_type_sprite(global.pt_hearts, spr_fx_particle_hearts, 0, 0, 1);
	part_type_color1(global.pt_hearts, c_white);
	part_type_alpha3(global.pt_hearts, 0, 1, 0);
	part_type_blend(global.pt_hearts, 1);
	part_type_life(global.pt_hearts, 10, 80);
	part_type_speed(global.pt_hearts, 0.10, .5, 0, 0);
	part_type_direction(global.pt_hearts, 90, 90, 0, 10);


}
