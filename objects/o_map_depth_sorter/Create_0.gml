/*
	Responsible for sorting and drawing all depth-sorted instances in the
	map room, including stacked sprites and billboards
*/

layer = layer_create(-1000);
depth_grid = ds_grid_create(0, 0);
value = "HELLO WORLD";