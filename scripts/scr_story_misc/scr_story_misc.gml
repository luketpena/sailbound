function StoryBronzeChest(_chance = 1, _timerOffset = 0) : StoryChest(_chance, _timerOffset, BronzeChest) constructor {} 

function StoryChest(
	_chance,
	_timerOffset,
	_chestConfig
) constructor {
	config = _chestConfig;
	chance = _chance;
	timerOffset = _timerOffset;
}