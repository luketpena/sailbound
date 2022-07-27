fixture_create_box(id, 32, 32, .1, 0, 0, 0, 0, true, true);
active = false;
target = null;

function init(_target) {
	target = _target;
}

function impact() {
	target.impact();
	target.damage();
	active = false;
}
