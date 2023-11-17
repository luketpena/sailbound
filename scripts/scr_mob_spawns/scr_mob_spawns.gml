// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
enum Chomper {
	Normal	
}

function spawn_chomper(side = 0) {
	//Selecting spawn x based on boat position
	var spawnX;
	if (side = 0) {
		spawnX = (global.boat_x > room_width / 2) ? 0 : room_width;
	} else {
		spawnX = (side = 1) ? 0 : room_width;
	}
	//Creating the chomper
	return instance_create_layer(spawnX, global.water_y, l_main, obj_mob_chomper);
}

function spawn_urchin() {
	if (instance_exists(ground)) {
		var spawnX = room_width;
		var spawnY = ground.findY(spawnX, .5);
		return instance_create_layer(spawnX, spawnY, l_main, obj_mob_urchin);
	}
}

function spawn_puffer() {
	var face = choose(1, -1);
	var spawnX = (face = 1) ? 0 : room_width;
	var spawnY = global.water_y + random_range(32, 128);
	
	var o = instance_create_layer(spawnX, spawnY, l_main, obj_mob_puffer);
	o.face = face;
	return o;
}

function spawn_seagull() {
	var face = choose(1, -1);
	var spawnX = (face = 1) ? 0 : room_width;
	var spawnY = global.water_y - random_range(64, 64);
	
	var o = instance_create_layer(spawnX, spawnY, l_main, obj_mob_seagull);
	o.face = face;
	return o;
}

function spawn_jellyfish() {
	var spawnX = room_width;
	var spawnY = global.water_y;
	
	var o = instance_create_layer(spawnX, spawnY, l_main, obj_mob_jellyfish);
	return o;
}

function spawn_pirate_sub() {
	var spawnX = mouse_x; //choose(0, room_width);
	var spawnY = mouse_y; //global.water_y + 128;
	
	var o = instance_create_layer(spawnX, spawnY, l_main, obj_mob_pirate_sub);
	return o;
}

function spawn_ghost() {
	var spawnX = mouse_x;
	var spawnY = mouse_y;
	
	var o = instance_create_layer(spawnX, spawnY, l_main, obj_mob_ghost);
	return o;
}
