if (clock.time > clock.point.nightfall && clock.time < clock.point.morning) {
	glow_alpha = fadeRange(clock.time, 20, 20, clock.point.night, clock.point.sunrise, 0, 1);
}