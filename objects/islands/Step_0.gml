// If the cave background is in and active, empty the island list and deactivate island generation
if (!blockedByCave && instance_exists(ceiling) && !ceiling.exiting) {
	blockedByCave = true;	
}
	
if (!blockedByCave) {
	// Running the islands
	array_foreach(islandList, function(_island) {
		_island.step();
	});

	if (active) {
		if (islandWait > 0) islandWait-- else {
			islandWait = random_range(islandWaitMin, islandWaitMax);
			generateIsland();
		}
	}
} else {
	// Clear the island list once ground is in
	if (ceiling.fullGroundIn) {
		islandList = [];	
	}
	
	// Blocked and waiting to be unblocked
	if (!instance_exists(ceiling) || !ceiling.exiting) {
		blockedByCave = false;	
	}
}

