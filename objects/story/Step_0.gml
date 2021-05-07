

if (active) {
	var _currentChapter = getCurrentChapter();
	
	if (gameMode = GameMode.Infinite) {
		progress = (progress + 1) % totalDuration;
		// Resets the chapter number manually when looped
		if (progress < chapters[1].startTime && chapterCurrentIndex != 0) {
			chapterCurrentIndex = 0;
			script_execute(getLastChapter().endMethod, chapterCount-1);
			script_execute(getFirstChapter().startMethod, 0);
		}
	} else {
		if (progress < totalDuration) progress++
		else if (!storyEnd) {
			// All methods for ending the chapter go here
			storyEnd = true;
			var _lastChapter = getLastChapter();
			script_execute(_lastChapter.endMethod, chapterCount-1);
			show_debug_message("Level completed!");
		}
	}
	
	// Getting the chapterProgress
	chapterProgress = (progress - _currentChapter.startTime) / _currentChapter.duration;

	if (chapterCurrentIndex < chapterCount-1) {
		var _nextChapter = getNextChapter();
		if (progress >= _nextChapter.startTime) {
			script_execute(_currentChapter.endMethod, chapterCurrentIndex);
			script_execute(_nextChapter.startMethod, chapterCurrentIndex+1);
			
			sys_islands.updateIslandSettings(_nextChapter);

			chapterCurrentIndex++;
		}
	}
}