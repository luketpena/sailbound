active = false;
islandTypes = [];

islandList = [];
islandSpeed = new MinMax(-.1, -.5);

u_color = shader_get_uniform(shd_fadeColor,"color"); //To what color does it fade?
u_pwr = shader_get_uniform(shd_fadeColor,"pwr"); //How far does it fade to that color?

islandWait = 0;
islandWaitMin = 0;
islandWaitMax = 0;

function activate(
	_islandTypes,
	_minTime,
	_maxTime
) {
	active = true;
	setIslandWaitTimes(_minTime, _maxTime);
	islandTypes = _islandTypes;
}

function setIslandWaitTimes(_min, _max) {
	islandWaitMin = _min;
	islandWantMax = _max;
}

function generateIsland() {
	if (array_length(islandTypes) == 0) exit;
	
	var _islandType = islandTypes[irandom(array_length(islandTypes) - 1)];
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