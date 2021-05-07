// Transitioning island min and max
if (islandWait_end != null && islandWait_start != null) {
	islandWait = [
		lerp(islandWait_start[0], islandWait_end[0], story.chapterProgress),
		lerp(islandWait_start[1], islandWait_end[1], story.chapterProgress),
	];
}

show_debug_message(islandWait);