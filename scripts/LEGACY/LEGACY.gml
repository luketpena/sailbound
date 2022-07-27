/////@param durationInSeconds Duration of the chapter in seconds
//function Chapter(
//	_duration
//) constructor {
//	// Timing
//	duration = _duration * room_speed; // How long the chapter lasts for the player
//	clockTimeEnd = null; // The time of day that chapter ends at
	
//	// Start and end methods
//	startMethod = null; // Trggered on chapter start
//	endMethod = null // Triggered on chapter end
	
//	// Mobs and spawn data
//	mobList = []; // A collection of potential mobs to spawn
//	dangerLevel = null; // The number of danger points to distribute to mobs
	
//	// Islands
//	islandType = null; // From the Island enum, defines the sprite
//	islandWait_start = null; // The frequency of island spawns at the start of the chapter
//	islandWait_end = null; // The frequency of island spawns at the end of the chapter
//}


/////@description A mob that is entered into a Chapter mob list
/////@param danger The number of danger points the mob will cost
/////@param spawnScript The script that brings the mob into the scene
//function MobDefinition(
//	_danger,
//	_spawnScript
//) constructor {
		
//}


//function ChapterEndDeclaration(index) {
//	show_debug_message("Chapter end: " + string(index));	
//}

//function ChapterStartDeclaration(index) {
//	show_debug_message("Chapter start: " + string(index));	
//}

/////@param chapters An array of chapters
//function story_set_chapters(chapterList) {
//	with(story) {
//		chapterCount = array_length(chapterList);
//		for (var i=0; i<chapterCount; i++) {
//			var _chapter = chapterList[i];
//			_chapter.startTime = totalDuration
//			totalDuration += _chapter.duration;
//			addChapter(_chapter);
//		}
//	}
//}

//// Adds a chapter to the chapters list
//function addChapter(chapter) {
//	//with(story) array_push(chapters, chapter);	
//}


/////@param Level
//function story_set_level(_level) {
//	story.level = _level;
//}

/////@description Sets and initiates a story
//function story_setAndStart(
//	_plot,
//	_gameMode,
//	_startingTimeOfDay
//) {
//	with(story) {
//		gameMode = _gameMode;
//		script_execute(_plot);
//		if (_startingTimeOfDay != null) {
//			clock.time = _startingTimeOfDay;
//		}
//		story_start();
//	}
//}
