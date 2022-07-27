fixture_create_circle(id, 16, .1, 0, 0, 0, 0, true, true);
dir = 0;
active = false;
target = null;

function init(_dir, _target) {
	dir = _dir;
	target = _target;
	active = true;
}

function impact() {
	active = false;
	target.impact();
}
