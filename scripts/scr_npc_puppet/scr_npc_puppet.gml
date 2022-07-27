function Emote(
	_sprite,
	_startScript = null,
	_endScript = null,
	_midScript = null,
	_midFrame = null
	
) constructor {
	sprite = _sprite;
	startScript = _startScript;
	endScript = _endScript;
	midScript = _midScript;
	midFrame = _midFrame;
}

function initNpcPuppet(walk, idle, talk) {
	sprite = {
		walk: walk,
		idle: idle,
		talk: talk,
	}

	base = {
		walk: walk,
		idle: idle,
		talk: talk,
	}

	sprite_index = idle;
}

