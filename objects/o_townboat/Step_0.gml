bobRot = (bobRot + 2) mod 360;
posY = y + lengthdir_y(2, bobRot);

if (targetExists()) {
	target.y = o_town_water.getPositionY(x) - 6;
	left.y = o_town_water.getPositionY(left.x);
	right.y = o_town_water.getPositionY(right.x);
	
	target.hull_angle = point_direction(right.x, right.y, left.x, left.y);
}

if (activeShip != vault.dock.activeShip) {
	activeShip = vault.dock.activeShip;
	resetBoat();
}