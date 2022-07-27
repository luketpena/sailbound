function ground_create(target_y, spawnTimeInSeconds, propCollection) {
	// The separation from room_height prevents phsics shape errors
	var g = instance_create_layer(0, room_height, "l_main", ground);
	g.changeHeight(target_y, spawnTimeInSeconds);
	g.props.list = script_execute(propCollection);
}

function ground_createAtStart(targetY, propCollection) {
	// The separation from room_height prevents phsics shape errors
	var g = instance_create_layer(0, targetY, "l_main", ground);
	g.props.list = script_execute(propCollection);
	g.populateProps();
}

function ground_finish() {
	if (instance_exists(ground)) {
		ground.finish();	
	}
}