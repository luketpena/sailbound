active = true;
activeRate = 0;

function off(_activeRate = .1) {
	if (_activeRate = -1) {
		image_alpha = 0;
	}
	activeRate = _activeRate;
	active = false;	
}

function on(_activeRate = .1, _targetAlpha = -1) {
	if (_targetAlpha != -1) {
		targetAlpha = _targetAlpha;	
	}
	if (_activeRate = -1) {
		image_alpha = 1;
	}
	activeRate = _activeRate;
	active = true;	
}