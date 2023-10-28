var stackers = ds_list_create();
collision_circle_list(o_map_player.x, o_map_player.y, global.hvw, prnt_map_stacked_object, false, true, stackers, false);

for (var i=0; i<layerCount; i++) {
	var offset = global.stackDepth * i;
	var camAngle = global.camAngle;
	var offsetX = -lengthdir_x(offset, -camAngle);
	var offsetY = -lengthdir_y(offset, -camAngle);

	for (var j=0; j<ds_list_size(stackers); j++) {
		var object = stackers[| j];
		
		if (i >= object.minHeight && i <= object.maxHeight) {
			object.layerIndex = i;
			object.offsetX = offsetX;
			object.offsetY = offsetY;
			with(object) drawLayer();
		}
	}
}

ds_list_destroy(stackers);