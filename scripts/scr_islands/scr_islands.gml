function island_list_cleanup() {
	with(islands) {
		//Removes islands from the list that don't exist anymore
		var cleanList = [];
		var cleanOffset = 0;
		for (var i=0; i<array_length(island_list); i++) {
			if (instance_exists(island_list[i])) {
				cleanList[i-cleanOffset] = island_list[i];	
			} else {
				cleanOffset++;	
			}
		}
		//array_copy(island_list,0,cleanList,0,array_length(cleanList));
		return cleanList;
	}
}

function island_list_insert(island) {
	with(islands) {
		var cleanList = island_list_cleanup();
		//Add new islands to their place in the array
		var islandNum = array_length(cleanList);
	
		island_list = [];
		if (islandNum=0) {
			//Putting the first island away
			island_list[0] = island;
		} else {
			var i = 0;
			var offset = 0;
		
			while(i<islandNum) {
				var o = cleanList[i];	
				if (instance_exists(o)) {
					if (offset=0 && island.position < o.position) {
						island_list[i] = island;
						offset++;
					}
				} else {
					offset++;	
				}
				island_list[i+offset] = cleanList[i];
				i++;
			}
		
			if (offset=0) {
				island_list[islandNum] = island;	
			}
		}
	}
}

function island_spawn_ext(in_position, _sprite, speed_min, speed_max, image, _x, _y, xscale) {
	
	var sprite_hw = sprite_get_width(_sprite)/2;
	var xx = _x;
	var yy = _y;
	var o = instance_create_layer(xx,yy,l_main,obj_island_standard);
	
	with(o) {
		shader_pwr = lerp(1,.2,in_position);
		position = in_position;
		mov_speed = lerp(speed_min, speed_max, in_position);
		exit_x = global.vx-sprite_hw;
		
		var size = lerp(.25,1,in_position);
		image_xscale = xscale;
		image_yscale = size;
		depth += (1-in_position);
		
		sprite_index = sprite;
		image_index = image;
	}

	return o;
}

///@param verticalPosition
///@param sprite
function island_spawn(verticalPosition, sprite) {
	var sprite_hw = sprite_get_width(sprite)/2,
		xx = global.vr + sprite_hw,
		yy = floor(global.horizon_y + 16*verticalPosition),
		image = irandom(sprite_get_number(sprite)-1);
	
	var o = instance_create_layer(xx, yy, l_main, obj_island_standard);
	
	with(o) {
		shader_pwr = lerp(1, .2, verticalPosition);
		position = verticalPosition;
		mov_speed = lerp(islands.island_speed[0], islands.island_speed[1], verticalPosition);
		exit_x = global.vx-sprite_hw;
		
		var size = lerp(.25, 1, verticalPosition);
		image_xscale = choose(-1, 1);
		image_yscale = size;
		depth += (1 - verticalPosition);
		
		sprite_index = sprite;
		image_index = image;
	}

	return o;
}


function island_spawn_pos(verticalPosition, sprite, horizontalPosition, flip = choose(-1, 1)) {
	var sprite_hw = sprite_get_width(sprite)/2,
		xx = lerp(global.vx - sprite_hw, global.vr + sprite_hw, horizontalPosition),
		yy = floor(global.horizon_y + 16 * verticalPosition),
		image = irandom(sprite_get_number(sprite)-1);
	
	var o = instance_create_layer(xx, yy, l_main, obj_island_standard);
	
	with(o) {
		shader_pwr = lerp(1, .2, verticalPosition);
		position = verticalPosition;
		mov_speed = lerp(islands.island_speed[0], islands.island_speed[1], verticalPosition);
		exit_x = global.vx-sprite_hw;
		
		var size = lerp(.25, 1, verticalPosition);
		image_xscale = flip;
		image_yscale = size;
		depth += (1 - verticalPosition);
		
		sprite_index = sprite;
		image_index = image;
	}

	return o;
}