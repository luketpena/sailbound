island_wait = [.5*room_speed,3*room_speed];

alarm[0] = 5;//random_range(island_wait[0],island_wait[1]); //Making an island

//Island Shader
u_color = shader_get_uniform(shd_fadeColor,"color"); //To what color does it fade?
u_pwr = shader_get_uniform(shd_fadeColor,"pwr"); //How far does it fade to that color?

//This array tracks the islands and is used to draw them in order
island_list = [];

#region Island Creation Functions
function island_list_cleanup() {
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

function island_list_insert(island) {
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
#endregion