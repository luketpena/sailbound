///@description Chains together many lengthdir calculations to return a final position
///@param {Array<struct>} lengthdirList
///@returns struct.Pos
function lengthdir_chain(_lengthdirList, _startDir = 0) {
	if !is_array(_lengthdirList) return;
	
	var _posList = [new Pos()];
	var _dir = _startDir;
	for (var i=0; i<array_length(_lengthdirList); i++) {
		var _ld = _lengthdirList[i];
		_dir += _ld.dir; // Direction must be accumulative
		
		var _previousPos = _posList[i];
		var _newPos = new Pos(
			_previousPos.x + lengthdir_x(_ld.len, _dir),
			_previousPos.y + lengthdir_y(_ld.len, _dir)
		);
		array_push(_posList, _newPos);
	}
	
	return _posList[array_length(_posList)-1];
}

///@returns {Array<struct.Pos> | undefined}