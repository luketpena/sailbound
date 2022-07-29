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
	
	var playerOffsetY = 20;
	global.motion = 0;

	if (targetDoor = noone) {
		if instance_exists(obj_playerStartPosition) {
			instance_create_layer(obj_playerStartPosition.x, obj_playerStartPosition.y + playerOffsetY, "l_main", o_town_player);
		} else if instance_exists(obj_doorMarker) {
			instance_create_layer(obj_doorMarker.x, obj_doorMarker.y + playerOffsetY, "l_main", o_town_player);
		}
	} else {	
		var doorCount = instance_number(obj_doorMarker);
		if (doorCount = 1) {
			instance_create_layer(obj_doorMarker.x, obj_doorMarker.y + playerOffsetY, "l_main", o_town_player);
		} else {
			for (var i=0; i<doorCount; i++) {
				var door = instance_find(obj_doorMarker, i);
				if (door.doorId = targetDoor) {
					instance_create_layer(door.x, door.y + playerOffsetY, "l_main", o_town_player);
					break;
				}
			}
		}
	}
	
	startTileBlending("ts_main_autotiled", .8);
	startTileBlending("ts_main_mid", .8);
	startTileBlending("ts_main_features", .8);
	startTileBlending("ts_woodBridge", 1);
	startTileBlending("ts_bkg", .3);
	
	
	instance_create_layer(0, 0, l_system, obj_camera_town);
	cameraSystem_update_all();
}


