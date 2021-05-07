function pick_color(biome) {
	switch(biome) {
		case Biome.Ocean: return c_blue;	
		case Biome.Volcano: return c_red;	
		case Biome.Volcanic: return c_maroon;
		case Biome.Skull: return c_dkgray;
		case Biome.Tropical: return c_energy;
		case Biome.Arctic: return c_white;
		case Biome.Bayou: return c_dktoxic;
	}
}

for (var i=0; i<map_length; i++) {
	var select_pos = [global.hvh-5,global.hvh];
	var xx = 4+4*i;
	draw_sprite_ext(spr_map_unit,0,xx,select_pos[0],1,1,0,pick_color(map_row[0][i].biome),1);
	draw_sprite_ext(spr_map_unit,0,xx,select_pos[1],1,1,0,pick_color(map_row[1][i].biome),1);
	
	if (i=location_cell) draw_sprite_ext(spr_map_unit,1,xx,select_pos[location_row],1,1,0,c_white,1);
}