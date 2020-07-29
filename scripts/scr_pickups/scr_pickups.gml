enum chests {
	gold,
	silver,
	bronze
}

function create_coin(x, y, spd_min, spd_max, dir_min, dir_max) {
	var o = instance_create_layer(x,y,"l_items",obj_coin);
	
	var spd = random_range(spd_min,spd_max);
	var dir = random_range(dir_min,dir_max);
	
	o.phy_speed_x = lengthdir_x(spd,dir);
	o.phy_speed_y = lengthdir_y(spd,dir);
	
	return o;
}


function create_chest(x, y, chest_type) {
	var o = instance_create_layer(x,y,"l_main",obj_chest);
	switch(chest_type) {
		case chests.gold: o.sprite_index = spr_chest_gold; break;	
		case chests.silver: o.sprite_index = spr_chest_silver; break;	
		case chests.bronze: o.sprite_index = spr_chest_bronze; break;	
	}
	o.chest_type = chest_type
	
	return o;
}

function spawn_chest(chest_type) {
	return create_chest(room_width,global.water_y,chest_type);
}