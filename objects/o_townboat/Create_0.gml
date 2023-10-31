target = noone;

bobRot = 0;
posY = y;
activeShip = undefined;
stats = undefined;
left = new Pos();
right = new Pos();

function setBoat() {
	if (!is_string(vault.dock.activeShip)) exit;
	
	stats = getActiveShipStats();
	var	hullSprite = stats.hullSprite;
	var	sailSprite = stats.sailSprite;
	var drawObject = getActiveShipDrawObject();
	
	var _hw = stats.width / 2;
	left.x = x - _hw;
	right.x = x + _hw;

	target = instance_create_depth(x, y, depth, drawObject);
	target.init(hullSprite, sailSprite, false, -1);	
	target.hull_angle = 180;
	target.sailSnapToHullAngle();
	
	log("STATS", stats);
}


function targetExists() {
	return target != noone && instance_exists(target);
}

function resetBoat() {
	if (targetExists()) {
		instance_destroy(target);
		target = null;
	}
	setBoat();
}
setBoat();