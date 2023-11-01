function create_coin(x, y, spd_min, spd_max, dir_min, dir_max) {
	var o = instance_create_layer(x,y,"l_items",obj_coin);
	
	var spd = random_range(spd_min,spd_max);
	var dir = random_range(dir_min,dir_max);
	
	o.phy_speed_x = lengthdir_x(spd,dir);
	o.phy_speed_y = lengthdir_y(spd,dir);
	
	return o;
}

// Creates a chest somewhere specific
function create_chest(x, y, _chestConfig) {
	var _chest = instance_create_layer(x, y, "l_main", o_chest);
	_chest.init(_chestConfig);
	return _chest;
}

// Creates a chest to float in from the right
function spawn_chest(_chestConfig) {
	return create_chest(room_width, global.water_y, _chestConfig);
}

///@description Creates a single ring
///@param position integer representing position, -2 to 2
function spawn_ring(position, spawnX = room_width) {
	var spawnY = global.water_y + 48 * position;
	return instance_create_layer(spawnX, spawnY, "l_main", obj_ring);
}

function spawn_ringGroup() {
	var count = irandom_range(1, 3);
	var lowPosition = instance_exists(ground) ? 1 : 2;
	var position = irandom_range(-2, lowPosition);
	
	for (var i=0; i<count; i++) {
		spawn_ring(position, room_width + 128 * i);
		var posChangeMin = (position = -2) ? 0 : -1;
		var posChangeMax = (instance_exists(ground) && position = 1) || (position = 2)  ? 0 : 1;
		
		position += irandom_range(posChangeMin, posChangeMax);
	}
}