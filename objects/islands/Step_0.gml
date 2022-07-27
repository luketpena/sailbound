// Transitioning island min and max
if (islandWait_transition) {
	islandWait.min = lerp(islandWait_saved.min, islandWait_target.min, story.chapterProgress);
	islandWait.max = lerp(islandWait_saved.max, islandWait_target.max, story.chapterProgress);
}