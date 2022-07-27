active = false;
endFunction = null;
timer = 0;

///@param timer
///@param endFunction
function init(_timer, _endFunction) {
	timer = _timer;
	endFunction = _endFunction;
	active = true;
}
