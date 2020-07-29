function pick_color(biome) {
	switch(biome) {
		case biomes.ocean: return c_blue;	
		case biomes.volcano: return c_red;	
		case biomes.volcanic: return c_maroon;
		case biomes.skull: return c_dkgray;
		case biomes.tropical: return c_energy;
		case biomes.arctic: return c_white;
		case biomes.bayou: return c_dktoxic;
	}
}

for (var i=0; i<map_length; i++) {
	var select_pos = [global.hvh-5,global.hvh];
	var xx = 4+4*i;
	draw_sprite_ext(spr_map_unit,0,xx,select_pos[0],1,1,0,pick_color(map_row[0][i].biome),1);
	draw_sprite_ext(spr_map_unit,0,xx,select_pos[1],1,1,0,pick_color(map_row[1][i].biome),1);
	
	if (i=location_cell) draw_sprite_ext(spr_map_unit,1,xx,select_pos[location_row],1,1,0,c_white,1);
}