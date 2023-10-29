alarm[0] = seconds(5);

var _islandType = islandTypes[irandom(array_length(islandTypes) - 1)];
var _depth = random(1);
var _newIsland = new _islandType(_depth);
addIsland(_newIsland);

array_foreach(islandList, function(_island) {
	log(_island.depth);
});

log("---------------------");