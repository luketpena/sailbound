state = 0;
size = 1;
roomTarget = noone;
wait = .1 * room_speed;
surf = noone;
active = false;
saveOnTransition = false;

function init(_roomTarget, _saveOnTransition) {
	roomTarget = _roomTarget;
	saveOnTransition = _saveOnTransition;
	active = true;
}