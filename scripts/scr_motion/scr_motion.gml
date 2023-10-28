///@description Rotating sine wave to provide angle and vectors
///@param {Real} rate
///@param {Real} start
function Sine(_rate, _start = 0) constructor {
	angle = _start;
	rate = _rate;
	
	// Must run this in a step event to be effective
	function step() {
		angle = loop(angle + rate, 0, 360);
	}
	
	function getX(_dis = 1) {
		return lengthdir_x(_dis, angle);
	}
	
	function getY(_dis = 1) {
		return lengthdir_y(_dis, angle);
	}
}