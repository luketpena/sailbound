
if (active) {
	var _currentChapter = getCurrentChapter();
	
	// -- Spawning Mobs --
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
	
	if (chest.active && array_length(chest.list) > 0) {
		if (chest.timer > 0) chest.timer-- else {
			var _diceIndex = diceTiers(chest.diceSides);
			var _chest = chest.list[_diceIndex];
			var _time = irandom_range(chest.minTimer, chest.maxTimer) + _chest.timerOffset;
			var _config = _chest.config;

			spawn_chest(_config);
			chest.timer = seconds(_time);
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

