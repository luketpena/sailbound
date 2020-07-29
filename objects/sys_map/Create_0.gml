//Holds the current biome enum
global.biome = -1;

//Stores the structs of map cell data
map_row[0] = [];
map_row[1] = [];

//Settings for game length
map_length = 25;

//Actual map location
location_row = 0; //Which row the player is located in
location_pos = 0; //Sliding decimal position
location_cell = 0; //The floored location position
location_cell_track = 0; //Snaps to match cell, triggering event_user(0)

//Map cell constructor
map_cell = function() constructor {
	biome = biomes.tropical;
	event = -1;
	palette = scr_palette_ocean;
	transition = false; //For transitioning lanes
	island = -1;
}

//Map generation
for (var i=0; i<map_length; i++) {
	map_row[0][i] = new map_cell();	
	map_row[1][i] = new map_cell();	
}


event_user(1);