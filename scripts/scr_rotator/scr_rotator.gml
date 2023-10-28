
///@param rate
///@param dis
///@param influencer This is another Rotator whose rotation affects the rate of this rotator
function Rotator(_rate, _dis = 1, _influencer = null, _influenceStr = 0, _pos = random(360)) constructor {
	pos = _pos;
	rate = _rate;
	dis = _dis;
	influencer = _influencer;
	influenceStr = _influenceStr;
	
	function step() {
		var calculatedPos = (pos + rate);
		if (influencer != null) {
			calculatedPos += influenceStr * ((influencer.getDisY(1) * .5) + .5);
		}
		pos = calculatedPos mod 360;	
	}
	
	function getDisY(_len = null, _addAngle = 0) {
		var len = _len ? _len : dis;
		return lengthdir_y(len, pos + _addAngle);	
	}
	
	function getDisX(_len = null, _addAngle = 0) {
		return lengthdir_x(len, pos + _addAngle);	
	}
}