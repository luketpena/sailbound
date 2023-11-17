/*
	State:
		- swim
		- rise
		- aim
		- fire
		- wait
		- sink
*/

state = "SWIM";
stateTimer = 2 * room_speed;

target = new Pos(x, y);
targetTimer = 2 * room_speed;
function targetRandomPosition() {
	target.x = random_range(global.vx, global.vr);
	target.y = random_range(global.water_y + 32, global.water_y + 64);	
}
sinkAccel = 0;

floatMove_init(2.5, .2);

function facePlayer() {
	image_xscale = o_boat_main.x > x ? 1 : -1;	
}

function stayAtSurface() {
	target.y = water_find_y_precise(x) - 8;
	y += (target.y - y) * .1;
	facePlayer();	
}