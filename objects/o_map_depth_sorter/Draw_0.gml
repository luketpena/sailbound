if (!ds_exists(depth_grid, ds_type_grid)) exit;

var _height = ds_grid_height(depth_grid);
for (var i=0; i<_height; i++) {
	var _inst = depth_grid[# 0, i];
	
	if (is_undefined(_inst) or !instance_exists(_inst)) {
		ds_grid_delete_row(depth_grid, i);
		continue;
	}
	
	with(_inst) {
		event_perform(ev_draw, 0);	
	}
}