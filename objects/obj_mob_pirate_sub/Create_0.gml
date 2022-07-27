floatMove_init(1, .02);

state = "attacking";
stateTimer = 0;
hp = 3;
ko = false;
koTimer = 3 * room_speed;

moveLimit = {
	left: global.vx + 64,
	right: global.vr - 64,
	top: global.water_y + 64,
	bottom: global.water_y + 96
}

moveTimer = 1 * room_speed;

targetPos = {
	x: x,
	y: y
}

ammoCount = 3;
attackTimer = 5 * room_speed;

puppet = instance_create_layer(x, y, layer, obj_mob_piratesub_puppet);

collider = instance_create_layer(x, y, layer, obj_mob_pirate_sub_collider);
collider.init(id);

function setTargetPos(
	_x = random_range(moveLimit.left, moveLimit.right),
	_y = random_range(moveLimit.top, moveLimit.bottom)
) {
	targetPos.x = _x;
	targetPos.y = _y;
}

function setMoveTimer() {
	moveTimer = random_range(2, 5) * room_speed;	
}

function fireTorpedo() {
	instance_create_layer(puppet.cannon.x, puppet.cannon.y-32, layer, obj_mob_pirate_sub_torpedo);
	ammoCount--;
	attackTimer = 3 * room_speed;
	puppet.fireCannon();
}

function reloadTorpedo() {
	ammoCount = 3;
	attackTimer = 3 * room_speed;
}

function sink() {
	state = "sinking";
	puppet.hideCannon();
	setTargetPos(x, global.water_y + 48);
}

function impact() {
	sink();
}

function damage() {
	hp--;
	if (hp = 0) {
		ko = true;
		puppet.die();
		state = "dying";
		setTargetPos(x, global.water_y + 48);
	} else {
		puppet.takeDamage();
	}
}


