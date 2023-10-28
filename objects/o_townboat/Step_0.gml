bobRot = (bobRot + 2) mod 360;
posY = y + lengthdir_y(2, bobRot);

if (targetExists()) {
	target.y = posY;
}

if (activeShip != vault.dock.activeShip) {
	activeShip = vault.dock.activeShip;
	resetBoat();
}