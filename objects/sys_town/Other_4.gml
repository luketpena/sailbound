if asset_has_tags(room, "town", asset_room) {
	instance_create_layer(0, 0, l_system, sys_falthruManager);

	instance_create_layer(0, 0, l_system, sys_lighting);
	instance_create_layer(0, 0, l_system, colors);
	instance_create_layer(0, 0, l_main, sys_drawing_town);
	instance_create_layer(0, 0, l_system, dialog);
	
	layer_create(
		layer_get_depth(l_main) - 10,
		"l_dust",
	);

	if (targetDoor = noone) {
		instance_create_layer(obj_playerStartPosition.x, obj_playerStartPosition.y, "l_main", o_town_player);
	} else {	
		var doorCount = instance_number(obj_doorMarker);
		if (doorCount = 1) {
			instance_create_layer(obj_doorMarker.x, obj_doorMarker.y, "l_main", o_town_player);
		} else {
			for (var i=0; i<doorCount; i++) {
				var door = instance_find(obj_doorMarker, i);
				if (door.doorId = targetDoor) {
					instance_create_layer(door.x, door.y, "l_main", o_town_player);
					break;
				}
			}
		}
	}
	
	instance_create_layer(0, 0, l_system, obj_camera_town);
	cameraSystem_update_all();
	
}


