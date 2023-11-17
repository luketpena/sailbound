active = false;
blockedByCave = false;
islandTypes = [];
islandChanceThresholds = [];
chanceSum = 0;

islandList = [];
islandSpeed = new MinMax(-.1, -.5);

u_color = shader_get_uniform(shd_fadeColor,"color"); //To what color does it fade?
u_pwr = shader_get_uniform(shd_fadeColor,"pwr"); //How far does it fade to that color?

islandWait = 0;
islandWaitMin = 0;
islandWaitMax = 0;

function activate(
	_islandsWithChance,
	_minTime,
	_maxTime
) {
	active = true;
	setIslandWaitTimes(_minTime, _maxTime);
	// Getting the dice chance
	for (var i=0; i<array_length(_islandsWithChance); i++) {
		var _config = _islandsWithChance[i];
		array_push(islandTypes, _config.island);
		chanceSum += _config.chance;
		array_push(islandChanceThresholds, chanceSum);
	}
}

function setIslandWaitTimes(_min, _max) {
	islandWaitMin = _min;
	islandWantMax = _max;
}

function generateIsland() {
	if (array_length(islandTypes) == 0) exit;
	
	
	var _roll = irandom(chanceSum);
	var _index = -1;
	
	for (var i=0; i<array_length(islandChanceThresholds); i++) {
		var _chance = islandChanceThresholds[i];
		if (_roll < _chance) {
			_index = i;
			break;
		}
	}
	
	if (_index == -1) exit;
	
	var _islandType = islandTypes[_index];
	var _depth = random(1);
	var _newIsland = new _islandType(_depth);
	addIsland(_newIsland);	
}

function addIsland(_island) {
	array_push(islandList, _island);
	array_sort(islandList, function(_a, _b) {
		return round(_a.depth * 100) - round(_b.depth * 100);
	})	
}