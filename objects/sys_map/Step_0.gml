if (!global.stop) {
	location_pos = (location_pos+.01) mod (map_length-1);
	location_cell_track = floor(location_pos);
	if (location_cell != location_cell_track) event_user(0);
}