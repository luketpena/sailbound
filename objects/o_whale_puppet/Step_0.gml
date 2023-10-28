// Setting the first tail position
posx[0] = x;
posy[0] = y;

// For swim animation
swimSine.step();
finSine.step();

// Does not use a sine because these are more complex to add "chaos"
beardRot1 = (beardRot1 + (beardRotRate1 * .75) + (beardRotRate1 * .25 * lengthdir_x(1, beardRot2))) mod 360;
beardRot2 = (beardRot2 + beardRotRate2) mod 360;

// Handling the spout position and status
setSpoutPos();
spoutSurfaced = water_find_y_basic(spout.x) > spout.y + 8;

if (tailLimit != tailLimitTarget) {
	tailLimit += (tailLimitTarget - tailLimit) * .01;	
}

if (blinkWait > 0) blinkWait-- else {
	blinkWait = irandom_range(blinkRange[0], blinkRange[1]);
	blinkIndex = 0;
}
if (blinkIndex < blinkIndexMax) blinkIndex += .2;
 