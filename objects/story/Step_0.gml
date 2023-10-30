
if (active) {
	var _currentChapter = getCurrentChapter();
	
	// -- Spawning Mobs 00
	if (mobActive) {
		array_foreach(mobs, function(_mob) {
			// Mobs must be ready and there must be room in the danger cap
			if (_mob.cooldown > 0) _mob.cooldown--
			else if (global.danger < maxDanger - _mob.danger) {
				if (dice(_mob.chance)) {
					_mob.spawnFunction();
					global.danger += _mob.danger;
					_mob.cooldown = seconds(random_range(_mob.cooldownMin, _mob.cooldownMax));
				}
			}
		});
	}
	
	if (chest.active) {
		if (chest.timer > 0) chest.timer-- else {
			var diceIndex = diceTiers(chest.diceSides);
			var chestType = chest.list[diceIndex].type;
			spawn_chest(chestType);
			chest.timer = (irandom_range(chest.minTimer, chest.maxTimer) + chest.list[diceIndex].timerOffset) * room_speed;
		}
	}
		
	// Looking to trigger the next chapter
	if (chapterCurrentIndex < chapterCount - 1) {
		var _nextChapter = getNextChapter();
		// Trigger when a new chapter starts
		if (progress >= _nextChapter.startTime) {
			story_chapterStart(_currentChapter, _nextChapter);
			chapterCurrentIndex++;
		}
	}
	
	if (ring.active) {
		if (ring.timer > 0) ring.timer-- else {
			ring.timer = seconds(random_range(ring.minTimer, ring.maxTimer));
			spawn_ringGroup();
		}
	}
	
	story_increaseProgress();
}

