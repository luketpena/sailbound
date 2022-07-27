divisionCount = 20; // How many slice to chop it into

// Sizing
headWidth = sprite_get_width(spr_whale_head);
bodyWidth = sprite_get_width(spr_whale_body);
bodyHeight = sprite_get_height(spr_whale_body);
hBodyHeight = bodyHeight / 2;
beardWidth = sprite_get_width(spr_whale_beard);
beardHeight = sprite_get_height(spr_whale_beard);

divUnit = bodyWidth / divisionCount; // How wide is every slice of division
texUnit = (1 / (divisionCount-1)); // How wide is every slice of the texture
tex = sprite_get_texture(spr_whale_body, 0); // Texture for drawing the whale body

// Individual division controls
centerAngle = array_create(divisionCount, 0); // The base angle of a segment
angle = array_create(divisionCount, 0); // The base angle + the motion for swimming
posx = array_create(divisionCount, 0); // Segment center x position
posy = array_create(divisionCount, 0); // Segment center y position

swimRot = 0;
swimRotRate = 1;
finRot = 0;
finRotRate = 1.5;
directionChangeLimit = .1;

tailBendAmount = 15;
tailLimit = -tailBendAmount;
tailLimitTarget = -tailBendAmount;
tailLimitActive = false;

blinkRange = [6 * room_speed, 12 * room_speed];
blinkWait = irandom_range(blinkRange[0], blinkRange[1]);
blinkIndexMax = sprite_get_number(spr_whale_eyelid) - 1;
blinkIndex = blinkIndexMax;

beardRot1 = irandom(360);
beardRot2 = irandom(360);
beardRotRate1 = 2;
beardRotRate2 = 5;

spout = new Pos();
spoutSurfaced = false;
eyeTarget = [mouse_x, mouse_y];

function setSpoutPos() {
	spout.x = x + lengthdir_x(105, angle[0] + 45);
	spout.y = y + lengthdir_y(105, angle[0] + 45);
}

function blink() {
	blinkWait = 0;	
}

function changeDirection(dir) {
	centerAngle[0] += angle_difference(dir, centerAngle[0]) * directionChangeLimit;
	angle[0] = centerAngle[0];
}

///@param x
///@param y
function moveEyeTarget(xx, yy) {
	eyeTarget[0] += (xx - eyeTarget[0]) * .05;
	eyeTarget[1] += (yy - eyeTarget[1]) * .05;
}

function toggleTailLimit() {
	tailLimitActive = !tailLimitActive;
	if (tailLimitActive) tailLimitTarget = 5 else tailLimitTarget = -tailBendAmount;
}
