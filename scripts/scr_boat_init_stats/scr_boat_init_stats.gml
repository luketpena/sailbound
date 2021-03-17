function boat_init_stats() {
	//>> Physical Stats
	boat_weight = 80; //gravity strength
	boat_drag = .95; //rate that boat slows down
	boat_buoyancy = .6; //rate that boat is pushed upwards under water
	boat_stop = 4; //speed division on contact with water
	boat_speed = 2; //max speed
	boat_agility = 3; //acceleration rate
	boat_width = 48; //distance the two halves are created from each other
	boat_hwidth = boat_width/2;
	boat_radius = 4; //decides the "size" of the collision area
	boat_offset = 10; //offset vertically of the radius

	boat_jump_power = 40; //physics impulse upwards on jump
	boat_dive_power = 30; //physics impulse downwards on dive

	boat_jump_limit = 6;
	boat_dive_limit = 5;

	//>> Bonus Stats
	bonus_speed = 0;
	bonus_agility = 0;
	//>> Final Stats
	total_speed = boat_speed+bonus_speed;
	total_agility = boat_agility+bonus_agility;
	//>> Sail Settings
	sail_x = 0;
	sail_y = 0;
}
