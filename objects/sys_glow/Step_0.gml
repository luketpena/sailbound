if (clock.time>ClockPoint.Nightfall && clock.time<ClockPoint.Morning) {
	glow_alpha = fadeRange(clock.time,20,20,ClockPoint.Night,ClockPoint.Sunrise,0,1);
}