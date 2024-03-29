///@description Checks if values exist in a given chapter from a config and applies them
function story_chapterStart(currentChapter, nextChapter) {
	// Check for ending and starting scripts
	if (currentChapter && hasProperty(currentChapter, "endScript")) {
		currentChapter.endScript();
	}
	if (hasProperty(nextChapter, "startScript")) {
		nextChapter.startScript();
	}
	
	// Set new mobs list if one exists, leave it alone if not
	// Set to inactive if list is empty
	if (hasProperty(nextChapter, "mobs")) {
		mobs = nextChapter.mobs;
		mobActive = (array_length(mobs) = 0) ? false : true;
	}
	
	if (hasProperty(nextChapter, "maxDanger")) {
		maxDanger = nextChapter.maxDanger
	}
	
	// Remove mobs that are on the list
	if (hasProperty(nextChapter, "mobsToRemove")) {
		for (var i=0; i<array_length(nextChapter.mobsToRemove); i++) {
			var targetMobName = nextChapter.mobsToRemove[i];
			// Iterate over mobs, find named mob, and remove it
			for (var j=0; j<array_length(mobs); j++) {	
				var mob = mobs[j];
				if (mob.name = targetMobName) {
					mobs = array_pluck(mobs, j);	
					break;
				}
			}
		}
	}
	
	// Add new mobs to the list
	if hasProperty(nextChapter, "mobsToAdd") {
		mobs = array_concat(mobs, nextChapter.mobsToAdd);
	}
	
	// Check for updates to ring settings
	if (hasProperty(nextChapter, "ringActive")) {
		ring.active = nextChapter.ringActive;
	}
	
	if (hasProperty(nextChapter, "ring")) {
		ring.minTimer = nextChapter.ring.minTimer;
		ring.maxTimer = nextChapter.ring.maxTimer;
	}
	
	// Checking for updates to chest settings
	if hasProperty(nextChapter, "chestActive") {
		chest.active = nextChapter.chestActive;	
	}

	if hasProperty(nextChapter, "chestTimer") {
		chest.minTimer = nextChapter.chestTimer.minTimer;
		chest.maxTimer = nextChapter.chestTimer.maxTimer;
	}
	
	if hasProperty(nextChapter, "chestList") {
		chest.list = nextChapter.chestList;
		getChestDiceSize();
	}
}

function getChestDiceSize() {
	with(story) {
		var newDiceSize = 0;
		var newDiceSides = [];
		for (var i=0; i<array_length(chest.list); i++) {
			var _chest = chest.list[i];
			newDiceSize += _chest.chance;
			array_push(newDiceSides, _chest.chance);
		}
		chest.diceSides = newDiceSides;
		chest.diceSize = newDiceSize;
	}
}

function story_init() {
	var _firstChapter = getFirstChapter();
	story_chapterStart(-1, _firstChapter);
	
	if (variable_struct_exists(config, "music")) {
		//audio_play_sound(config.music, 0, true);	
	}
	
	// Execute the initializing script
	if (variable_struct_exists(config, "startScript")) {
		config.startScript();
	}
	
	// Set initial palette
	if (variable_struct_exists(config, "startPalette")) {
		colors.setPalette(config.startPalette);
	}
}

// Triggers the end of a story in default mode
function story_end() {
	storyEnd = true;
	vault.bank.incrementGold(global.coin);
	vault.inventory.recoverShips(global.level_id);

	transitionToRoom(r_town, true);
}

function story_stop() {
	story.active = false;	
}

// Progresses the story for both default and infinite mode
function story_increaseProgress() {
	var _currentChapter = getCurrentChapter();
	switch(gameMode) {
		case GameMode.Default:
			if (progress < totalDuration) progress++
			else if (!storyEnd) {
				story_end();	
			}
			break;
		case GameMode.Infinite:
			progress = (progress + 1) % totalDuration;
			break;
	}
	// Calculating the chapter specific progress from total progress
	chapterProgress = (progress - _currentChapter.startTime) / (seconds(_currentChapter.duration));
	global.level_progress = (progress / totalDuration);
}

// Returns the current chapter
function getCurrentChapter() {
	with(story) return config.chapters[chapterCurrentIndex];	
}

// Returns the next chapter (does not move to next chapter)
function getNextChapter() {
	with(story) {
		if (chapterCurrentIndex < chapterCount - 1) {
			return config.chapters[chapterCurrentIndex + 1];
		} else {
			return undefined;
		}
	}
}

// Returns the last chapter
function getLastChapter() {
	with(story) return config.chapters[chapterCount - 1];	
}

// Returns the first chapter
function getFirstChapter() {
	with(story) return config.chapters[0];	
}
