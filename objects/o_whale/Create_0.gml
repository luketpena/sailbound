headHeight = sprite_get_height(s_whale_head);

puppet = instance_create_layer(x, y, layer, o_whale_puppet);
yLimit = global.water_y + (headHeight * .6);

target = [room_width/2, global.water_y + headHeight]
maxSpeedX = .5;
speedX = maxSpeedX;
speedY = 0;
accelX = .005;
accelY = .005;
complete = false;

maxMoveSpeed = .5;

active = false;

breachTimingRange = [seconds(5), seconds(20)];
breachCountdown = irandom_range(breachTimingRange[0], breachTimingRange[1]);
breaching = false;

spoutObject = null;
spoutTimer = -1;

function setHorizontalTarget() {
	target[0] = irandom_range(global.vx + 64, global.vr - 64);
}

function setVerticalTarget(breach = false) {
	if (breach) {
		target[1] = yLimit;	
	} else {
		target[1] = global.water_y + irandom_range(
			headHeight * .8,
			headHeight * 2
		);
	}
}

function init() {
	active = true;
	setHorizontalTarget();
	setVerticalTarget();
}

function finish() {
	complete = true;
	target[0] = room_width + 1000;
	target[1] = global.water_y + (headHeight * 1.5);
}