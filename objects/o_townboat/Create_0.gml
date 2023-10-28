target = null;

bobRot = 0;
posY = y;
activeShip = undefined;

function setBoat() {
	if (!is_string(vault.dock.activeShip)) exit;
	log("SETTING BOAT FOR TOWN", vault.dock.activeShip);
	
	var stats = getActiveShipStats();
	var	hullSprite = stats.hullSprite;
	var	sailSprite = stats.sailSprite;
	var drawObject = getActiveShipDrawObject();

	target = instance_create_depth(x, y, depth, drawObject);
	target.init(hullSprite, sailSprite, false, -1);	
	target.hull_angle = 180;
	target.sailSnapToHullAngle();
}

function targetExists() {
	return target != null && instance_exists(target)	;
}

function resetBoat() {
	if (targetExists()) {
		instance_destroy(target);
		target = null;
	}
	setBoat();
}

setBoat();