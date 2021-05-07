///@param durationInSeconds Duration of the chapter in seconds
///@param mobList A collection of MobDefinitions
///@param dangerLevel A number representing the total number of danger points available for mobs
///@param startMethod Executed when the chapter starts
///@param endMethod Executed when the chapter ends
///@param IslandType
///@param islandWait_start(MinMax)
///@param islandWait_end(MinMax)
function Chapter(
	_duration,
	_mobList,
	_dangerLevel,
	_startMethod,
	_endMethod,
	_islandType,
	_islandWait_start,
	_islandWait_end
) constructor {
	startTime = null;
	duration = _duration * room_speed;
	startMethod = _startMethod;
	endMethod = _endMethod;
	// The time of day out of 360, null indicates no change in time
	timeEnd = null;
	mobList = []; // A list of MobDefinitions that can spawn
	dangerLevel = _dangerLevel; // A number determining the number of danger points available
	islandType = _islandType; // If null, sets islands to inactive
	islandWait_start = _islandWait_start;
	islandWait_end = _islandWait_end;
}


///@description A mob that is entered into a Chapter mob list
///@param danger The number of danger points the mob will cost
///@param spawnScript The script that brings the mob into the scene
function MobDefinition(
	_danger,
	_spawnScript
) constructor {
		
}

function ChapterEndDeclaration(index) {
	show_debug_message("Chapter end: " + string(index));	
}

function ChapterStartDeclaration(index) {
	show_debug_message("Chapter start: " + string(index));	
}

function story_start() {
	story.active = true;	
}

function story_stop() {
	story.active = false;	
}

// Adds a chapter to the chapters list
function addChapter(chapter) {
	with(story) array_push(chapters, chapter);	
}

///@param chapters An array of chapters
function story_set_chapters(chapterList) {
	with(story) {
		chapterCount = array_length(chapterList);
		for (var i=0; i<chapterCount; i++) {
			var _chapter = chapterList[i];
			_chapter.startTime = totalDuration
			totalDuration += _chapter.duration;
			addChapter(_chapter);
		}
	}
}

// Returns the current chapter
function getCurrentChapter() {
	with(story) return chapters[chapterCurrentIndex];	
}

// Returns the next chapter (does not move to next chapter)
function getNextChapter() {
	with(story) {
		if (chapterCurrentIndex < chapterCount-1) {
			return chapters[chapterCurrentIndex+1];
		} else {
			return null;
		}
	}
}

// Returns the last chapter
function getLastChapter() {
	with(story) return chapters[chapterCount - 1];	
}

function getFirstChapter() {
	with(story) return chapters[0];	
}

///@description Sets and initiates a story
function story_setAndStart(
	_plot,
	_gameMode,
	_startingTimeOfDay
) {
	with(story) {
		gameMode = _gameMode;
		script_execute(_plot);
		if (_startingTimeOfDay != null) {
			global.clock_time = _startingTimeOfDay;
		}
		story_start();
	}
}

///@param Level
function story_set_level(_level) {
	story.level = _level;
}

function story_set_gameMode(_gameMode) {
	story.gameMode = _gameMode;	
}