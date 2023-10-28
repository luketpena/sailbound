///@description Loops a value between a min and max
///@param {Real} value
///@param {Real} min
///@param {Real} max
function loop(_value, _min, _max) {
	// Accounting for if the max is smaller than the min (i.e. negatives)
	var _high = _max > _min ? _max : _min;
	var _low = _max < _min ? _max : _min;
	
	if (_value >= _high) {
		return _low + (_value - _high);	
	}
	if (_value < _low) {
		return _high - (_low - _value);	
	}
	return _value;
}