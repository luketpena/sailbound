///@description Make island

alarm[0] = random_range(island_wait[0],island_wait[1]);

if (island_get_sprite(global.biome)!=-1) {
	//Create island
	var newIsland = island_spawn(random(1), biomes.tropical, island_speed_min, island_speed_max);
	//Insert island into list
	island_list_insert(newIsland);
}