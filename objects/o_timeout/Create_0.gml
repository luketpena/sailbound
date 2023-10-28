endFunction = function () {
	errLog("Blank end function provided to timeout function call");
};

///@param timer
///@param endFunction
function init(_timer, _endFunction) {
	endFunction = _endFunction;
	alarm[0] = _timer;
}
