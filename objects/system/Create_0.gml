/*
	The system holds high-level information and generates the other rooms.
*/

//>> Setup
application_surface_enable(true);
os_lock_orientation(true);
//window_set_fullscreen(true);

debugMode = false;

osType = noone;

//>> Initialization
cameraSystem_init();

//>> Fonts
global.font_numbers_large = font_add_sprite_ext(spr_font_numbers_large,"0123456789",true,2);
global.font_normal_medium = font_add_sprite_ext(spr_font_normal_medium,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?:;'$%()-@",true,2);
global.font_normal_small = font_add_sprite_ext(spr_font_normal_small,  " ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789.,!?:;'$%()-@+/abxy$*",true,1);

vertex_format_begin();
vertex_format_add_colour();
vertex_format_add_position();
vertex_format_add_normal();
global.format_perspective = vertex_format_end();

//>> Room transition knapsack
/*
	The knapsack is the small bundle of variables the game carries with it from room to room
*/
knapsack = {
	save: function() {
		var name = room_get_name(room);
		if (name = "rm_water") {
			islands.save();	
		}
	},
	load: function() {
		var name = room_get_name(room);
		if (name = "rm_water") {
			islands.load();		
		}
	},
	
	islandSave: {
		value: [],
		save: function() {
			if (instance_exists(islands)) {
				var list = islands.island_list;
				for (var i=0; i<array_length(list); i++) {
					var island = list[i];
					value[i] = {
						image: island.image_index,
						position: island.position,
						x: island.x,
						y: island.y,
						xscale: island.image_xscale
					}
				}
			}
		}, // END of save function
		load: function() {
			for (var i=0; i<array_length(value); i++) {
				var data = value[i];
				var newIsland = island_spawn_ext(data.position, Biome.Tropical, islands.island_speed_min, islands.island_speed_max, data.image, data.x, data.y, data.xscale);
				islands.island_list_insert(newIsland);
				delete value[i];
			}
			value = [];
		} // END of load function
	}, // END of islands
	
}