/// @description Insert description here
// You can write your code in this editor


//item_spawn_box(mouse_x,mouse_y,choose(items.cannon));
//create_chest(mouse_x,mouse_y,choose(chests.gold, chests.silver, chests.bronze));
var item_types = [
	{
		sprite: spr_seaweed,
		chance: 5
	},
	{
		sprite: spr_coral,
		chance: 2
	}
];

spawn_ground(global.water_y+64, spr_sand, item_types);
//spawn_amb_fish_school();

//instance_create_layer(mouse_x,mouse_y,"l_main",obj_item_repairBuddy);