///@description Make island

islandAlarm_set();

if (islandType != null) {
	//Create island
	var newIsland = island_spawn(random(1), islandType);
	//Insert island into list
	island_list_insert(newIsland);
}