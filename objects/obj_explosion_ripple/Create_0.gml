function water_surface_get_y(pos) {
	return settings.water_depth * pos;
}

size_max = 1;
size_min = .2;

scale_lerp = 0;
scale = size_min;

image_alpha = .1;

burst = 4;