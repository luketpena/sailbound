/// @description Generate Map

map_row[0][5].transition = true;

/*
repeat(irandom_range(1,3)) map_gen_center(2,6,map_length,Biome.Arctic,Biome.Arctic,1,1,7,7);
	
map_gen_center(1,10,map_length-10,Biome.Volcano,Biome.Volcanic,4,2,4,6);
map_gen_center(8,10,map_length-10,Biome.Volcano,Biome.Volcanic,4,2,4,6);
	
map_gen_skull();
map_gen_tropical();
	
map_gen_bayou();
	
map_apply_palettes();