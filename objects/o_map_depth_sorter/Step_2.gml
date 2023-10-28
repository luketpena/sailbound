// Calculated the depth of all depth-sorted instances in the room
var _height = ds_grid_height(depth_grid);
for (var i=0; i<_height; i++) {
	var _inst = depth_grid[# 0, i];
	
	if (is_undefined(_inst) or !instance_exists(_inst)) {
		ds_grid_delete_row(depth_grid, i);
		continue;
	}
	
	var _new_depth = compute_3d_depth(_inst.x, _inst.y, _inst.z);
	depth_grid[# 1, i] = _new_depth;
}

ds_grid_sort(depth_grid, 1, false);