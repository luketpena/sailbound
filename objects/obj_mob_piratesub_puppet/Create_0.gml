engine = {
	x: 0,
	y: 0,
	angle: 218,
	dis: 20,
	imageAngle: 0,
	propEngine: {
		x: 0,
		y: 0,
		angle: 213,
		dis: 26,
		rot: 0,
	}
}

propeller = {
	x: 0,
	y: 0,
	dis: 37,
	rot: 0,
}

jaw = {
	state: "open",
	topClosedAngle: -35,
	bottomClosedAngle: 45,
	closeLerp: 0,
	closeAngle: 0,
	wait: 0,
	clapCount: 0,
}

cannon = {
	x: 0,
	y: 0,
	x2: 0,
	y2: 0,
	angle: 100,
	dis: 24,
	fire: 0,
	state: "closed",
	openLerp: 0,
	openValue: 0,
	openOffset: 11,
	wait: 0
}

bodyAngle = 0;
bodyAngleRot = 0;
bodyAngleSet = 10;

angleHold = 0;
shake = 0;
shakeDir = 0;
dying = false;

xx = x;
yy = y;

function snapJaw() {
	jaw.state = "snap";
	jaw.closeLerp = 0;
}

function fireCannon() {
	cannon.fire = 1;	
}

function exposeCannon() {
	cannon.state = "opening";
	cannon.openLerp = 0;
}

function hideCannon() {
	cannon.state = "closing";
	cannon.openLerp = 0;
}

function takeDamage() {
	jaw.state = "clapShut";
	jaw.clapCount = 0;
	jaw.closeLerp = 0;
	shake = 3;
	if (cannon.state != "closed") {
		hideCannon();	
	}
}

function die() {
	dying = true;
	shake = 2;
	jaw.state = "clapShut";
}
