/*
	The system holds high-level information and generates the other rooms.
*/

//>> Setup
application_surface_enable(true);
os_lock_orientation(true);
window_set_fullscreen(true);
show_debug_overlay(false);

//>> Initialization
cameraSystem_init();

//>> Fonts
global.font_numbers_large = font_add_sprite_ext(spr_font_numbers_large,"0123456789",true,2);
global.font_normal_medium = font_add_sprite_ext(spr_font_normal_medium,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?:;'$%()-@",true,2);
global.font_normal_small = font_add_sprite_ext(spr_font_normal_small,"ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789.,!?:;'$%()-@+/abxy$*",true,1);


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
	
	islands: {
		value: [],
		save: function() {
			if (instance_exists(sys_islands)) {
				var list = sys_islands.island_list;
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
				var newIsland = island_spawn_ext(data.position, biomes.tropical, sys_islands.island_speed_min, sys_islands.island_speed_max, data.image, data.x, data.y, data.xscale);
				sys_islands.island_list_insert(newIsland);
				delete value[i];
			}
			value = [];
		} // END of load function
	}, // END of islands
	
	clock: {
		
	}
}