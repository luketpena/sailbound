/// @description Insert description here
// You can write your code in this editor


//item_spawn_box(mouse_x,mouse_y,choose(items.cannon));
//create_chest(mouse_x,mouse_y,choose(chests.gold, chests.silver, chests.bronze));
//var item_types = [
//	{
//		sprite: spr_seaweed,
//		chance: 5
//	},
//	{
//		sprite: spr_coral,
//		chance: 2
//	}
//];

//var debris_types = [
//	{
//		sprite: spr_ground_debris_coral_stone_large,
//		chance: 100
//	},
//	{
//		sprite: spr_ground_debris_seaweed,
//		chance: 16
//	}
//];



//spawn_ground(global.water_y+64, spr_sand, item_types, debris_types, item_types, spr_ground_coral_edge);
//spawn_amb_fish_school();

//instance_create_layer(mouse_x,mouse_y,"l_main",obj_explosion_puff);

if (room_get_name(room) = "rm_water") {
	room_goto(rm_test)	
} else {
	room_goto(rm_water)	
}

//spawn_location(spr_loc_lighthouse, 0);
