// Finds what percent a value is between a min and max value
function get_progress(_value, _min, _max) {
	var _distance = _max - _min;
	return (_value - _min) / _distance;
}