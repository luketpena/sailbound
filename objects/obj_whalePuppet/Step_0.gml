posx[0] = x;
posy[0] = y;

swimRot = (swimRot + swimRotRate) mod 360;
finRot = (finRot + finRotRate) mod 360;
beardRot1 = (beardRot1 + (beardRotRate1 * .75) + (beardRotRate1 * .25 * lengthdir_x(1, beardRot2))) mod 360;
beardRot2 = (beardRot2 + beardRotRate2) mod 360;

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

if mouse_check_button(mb_right) moveEyeTarget(mouse_x, mouse_y);

if mouse_check_button(mb_left) {
	changeDirection(point_direction(x, y, mouse_x, mouse_y))
}

if keyboard_check_pressed(vk_space) blink();