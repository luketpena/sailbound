function surface_cleanup(_surface) {
	if (surface_exists(_surface)) {
		surface_free(_surface);
	}
}
