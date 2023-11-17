surf = -1;
texture = -1;

active = false;
value = 0;
duration = seconds(5);
rate = 0;

function setActive(_active, _duration = duration) {
	active = _active;
	duration = _duration;
	rate = seconds(1) / duration;
}