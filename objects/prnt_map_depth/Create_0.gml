z = 0;
active = false;
visible = false;

with(o_map_depth_sorter) {
	if (ds_exists(depth_grid, ds_type_grid)) {
		var _height = ds_grid_height(depth_grid);
		ds_grid_resize(depth_grid, 2, _height + 1);
		depth_grid[# 0, _height] = other.id;
		depth_grid[# 1, _height] = other.y;
	} else {
		var _height = 1;
		depth_grid = ds_grid_create(2, 1);
		depth_grid[# 0, 0] = other.id;
		depth_grid[# 1, 0] = other.y;
	}
}