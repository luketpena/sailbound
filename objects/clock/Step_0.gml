if (active) {
	// This is for infinite mode only, default mode dictates time of day
	elapsed += clock_speed;
	if keyboard_check(vk_right) elapsed -= .01;
	if keyboard_check(vk_left) elapsed += .01;
} else {
	if (timeEnd != null) {
		elapsed = lerp(timeStart, timeEnd, story.chapterProgress);
	}
}

// Only needs to calculate things if the time has changed significantly
if (abs(elapsed - savedElapsed) > .0001) {
	savedElapsed = elapsed;
	calculateTimeAndDay();
	updatePeriod();
	updateNightFade();
}

