///@description Make island

islandAlarm_set();

if (islandType != null) {
	var newIsland = island_spawn(random(1), islandType);
	island_list_insert(newIsland);
}