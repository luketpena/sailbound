
if (active) {
	var _currentChapter = getCurrentChapter();
	
	if (gameMode = GameMode.Infinite) {
		
		// Resets the chapter number manually when looped
		if (progress < config.chapters[1].startTime && chapterCurrentIndex != 0) {
			chapterCurrentIndex = 0;
		}
	} 
	// Getting the chapterProgress
	if (mobActive) {
		for (var i=0; i<array_length(mobs); i++) {
			var mob = mobs[i];
			// Mobs must be ready and there must be room in the danger cap
			if (mob.cooldown = 0) {
				if (global.danger < maxDanger - mob.danger) {
					var roll = dice(mob.chance);
					if (roll) {
						mob.spawnScript();
						global.danger += mob.danger;
						mob.cooldown = round(random_range(mob.cooldownMin, mob.cooldownMax) * room_speed);
					}
				}
			} else {
				mob.cooldown--;	
			}
		}
	}
	
	if (chest.active) {
		if (chest.timer > 0) chest.timer-- else {
			var diceIndex = diceTiers(chest.diceSides);
			var chestType = chest.list[diceIndex].type;
			spawn_chest(chestType);
			chest.timer = (irandom_range(chest.minTimer, chest.maxTimer) + chest.list[diceIndex].timerOffset) * room_speed;
		}
	}
		
	if (chapterCurrentIndex < chapterCount-1) {
		var _nextChapter = getNextChapter();
		// Trigger when a new chapter starts
		if (progress >= _nextChapter.startTime) {
			story_chapterStart(_currentChapter, _nextChapter);
			chapterCurrentIndex++;
		}
	}
	
	if (ring.active) {
		if (ring.timer > 0) ring.timer-- else {
			ring.timer = random_range(ring.minTimer, ring.maxTimer) * room_speed;
			spawn_ringGroup();
		}
	}
	
	story_increaseProgress();
}

