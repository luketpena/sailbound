array_foreach(islandList, function(_island) {
	_island.step();
});

if (active) {
	if (islandWait > 0) islandWait-- else {
		islandWait = random_range(islandWaitMin, islandWaitMax);
		generateIsland();
	}
}