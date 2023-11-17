function getSpawnLimitY(_Side) {
	var _groundExists = instance_exists(ground);
	var _ceilingExists = instance_exists(ceiling);
	
	var _min = _ceilingExists ? ceiling.points[_Side == Side.Left ? 0 : array_length(ceiling.points) - 1] : 0;
	var _max = _groundExists ? ground.points[_Side == Side.Left ? 0 : array_length(ground.points) - 1] : room_height;
	
	return new MinMax(_min, _max);
}