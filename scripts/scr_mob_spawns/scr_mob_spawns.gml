// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
enum chomper {
	normal	
}

function spawn_chomper(type) {
	var object, spawn_x;
	
	//Selecting chomper object based on type
	switch (type) {
		case chomper.normal: object = obj_mob_chomper; break;	
	}
	
	//Selecting spawn x based on boat position
	if (global.boat_x>room_width/2) spawn_x = 0 else spawn_x = room_width;
	
	//Creating the chomper
	instance_create_layer(spawn_x, global.water_y, l_main, object);
}