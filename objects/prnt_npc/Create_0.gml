moveSpeed = 0;
maxMoveSpeed = 1;
face = 1;

isWalking = false;
walled = false;
stopped = false;
targetX = 0;
targetActive = false;

puppet = null;

function init(_puppet) {
	puppet = instance_create_layer(x, y, layer, _puppet);	
}

function move_point(x) {
	targetX = x;
	targetActive = true;
}

function move_screen(screenLerp) {
	var xx = global.vx + lerp(0, global.vw, screenLerp);
	move_point(xx);
}

function move_toObject(target, offset = 0) {
	move_point(target.x + offset);	
}

function move_toPlayer(offset = 0) {
	move_toObject(o_town_player, offset);	
}

function facePoint(_x) {
	face = (_x > x) ? 1 : -1;
}

function snapToGround() {
	y = collision_impact_rectangle_v(64, -1, x-8, x+8, y, prnt_block, true) - 11;
}
snapToGround();
