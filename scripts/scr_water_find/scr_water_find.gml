//Finds the interpolated y position at a give x coodinate
function water_find_y_precise(x) {
	with(sys_water) {
		var choice = clamp(x/water_width,0,water_num-1);
		if (water_point_active[choice]) {
			return lerp(
				water_point_y[choice],
				water_point_y[choice+1],
				(x-water_point_x[choice])/water_width
			);
		} else {
			return global.water_y;
		}
	}
}

//Finds the y position of the nearest water point to the given x coordinate
function water_find_y_basic(x) {
	with(sys_water) {
		return water_point_y[clamp(x/water_width,0,water_num-1)];
	}
}