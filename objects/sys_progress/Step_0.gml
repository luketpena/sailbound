if (!progress_paused) {
	progress_slider += progress_rate;
	progress_unit = floor(progress_slider);
	if (global.progress != progress_unit) event_user(0);
}