function biome_get_palette(biome) {
	switch(biome) {
		case Biome.Ocean:
		case Biome.Skull:
		case Biome.Tropical:
			return scr_palette_ocean;
		case Biome.Arctic: 
			return scr_palette_arctic;
		case Biome.Bayou: 
			return scr_palette_arctic;
		case Biome.Volcanic:
		case Biome.Volcano:
			return scr_palette_volcanic;
	}
}


function map_apply_palettes() {
	for (var i=0; i<map_length; i++) {
		for (var j=0; j<2; j++) {
			map_row[j][i].palette = biome_get_palette(map_row[j][i].biome);	
		}
	}
}

function map_collect_empty(lane) {
	var collection = [];
	for (var i=0; i<map_length; i++) {
		if (map_row[lane].biome=Biome.Ocean) collection[array_length(collection)] = i;
	}
	return collection;
}

function map_find_random_empty(_lane) {
	var collections = [
		map_collect_empty(0),
		map_collect_empty(1)
	];
	
	switch(_lane) {
		case -1:	
			break;
		default:
			var selected_length = array_length(collections[_lane]);
			if (selected_length>0) {
				return collections[_lane][irandom(selected_length-1)];
			} else return -1; //No free space in selected lane
			break;
	}
}

function map_gen_center(gen_chance,gen_start,gen_end,biome_center,biome_edges,l_back,l_forward,chance_back,chance_forward) {
	if (dice(gen_chance)) {
		var lane = choose(0,1);
		var select = clamp(irandom_range(gen_start,gen_end),0,map_length-1);
		map_row[lane][select].biome = biome_center;
		
		for (var i=0; (i<l_forward && (select+i+1)<map_length); i++) {
			var chance = lerp(1,chance_forward,i/l_forward);
			if dice(chance) map_row[lane][select+1+i].biome = biome_edges;
		}
		
		for (var i=0; (i<l_back && (select-i-1)>0); i++) {
			var chance = lerp(1,chance_back,i/l_back);
			if dice(chance) map_row[lane][select-1-i].biome = biome_edges;
		}
	}	
}

function map_gen_skull() {
	var offset = 10
	for (var i=0; i<2; i++) {
		for (var j=0; j<map_length-offset; j++) {
			chance = lerp(8,1,j/(map_length-offset));
			if dice(chance) {
				if (map_row[i][j+offset].biome=Biome.Ocean) map_row[i][j+offset].biome=Biome.Skull;
			}
		}
	}
}

function map_gen_tropical() {
	var length = 20;
	for (var i=0; i<2; i++) {
		for (var j=0; j<length; j++) {
			chance = lerp(1,9,j/length);
			if dice(chance) {
				if (map_row[i][j].biome=Biome.Ocean) map_row[i][j].biome=Biome.Tropical;
			}
		}
	}
}

function map_gen_bayou() {
	for (var i=0; i<2; i++) {
		for (var j=1; j<map_length-1; j++) {
			var chance = 0;
			if (map_row[i][j].biome=Biome.Ocean) {
				if (map_row[i][j-1].biome=Biome.Skull) chance += 2;
				if (map_row[i][j-1].biome=Biome.Tropical) chance += 1;
				
				if (map_row[i][j+1].biome=Biome.Skull) chance += 2;
				if (map_row[i][j+1].biome=Biome.Tropical) chance += 1;
				
			}
			
			if (chance>0) {
				chance += floor( (j/map_length)*chapter_number );
				if dice(lerp(8,1,chance/(4+chapter_number))) {
					map_row[i][j].biome = Biome.Bayou;	
				}
			}
		}
	}	
}