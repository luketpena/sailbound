if (cannon.state = "opening" || cannon.state = "wait") {
	if (bodyAngleSet > 2) bodyAngleSet *= .9;	
} else {
	if (bodyAngleSet < 10) bodyAngleSet += .05;	
}

if (shake > 0) {
	if (!dying) {
		shake -= .1;
	}
	shakeDir = random(360);
	xx = x + lengthdir_x(shake, shakeDir);
	yy = y + lengthdir_y(shake, shakeDir);
} else {
	xx = x;
	yy = y;
}

bodyAngleRot = (bodyAngleRot + 2) mod 360;
bodyAngle = lengthdir_y(bodyAngleSet, bodyAngleRot);

angleHold = image_angle;
image_angle = bodyAngle;
var angleDif = image_angle - angleHold;

engine.x = xx + lengthdir_x(engine.dis, image_angle + engine.angle);
engine.y = yy + lengthdir_y(engine.dis, image_angle + engine.angle);

engine.imageAngle += angleDif;
engine.imageAngle -= (engine.imageAngle) * .1;

if (cannon.fire > 0) {
	cannon.fire -= .05;	
}

var cannonFireOffset = 4 * cannon.fire
cannon.x = xx + lengthdir_x(cannon.dis - cannonFireOffset, image_angle + cannon.angle);
cannon.y = yy + lengthdir_y(cannon.dis - cannonFireOffset, image_angle + cannon.angle);

cannon.x2 = cannon.x + lengthdir_x(cannon.openValue - cannonFireOffset, engine.imageAngle + 90);
cannon.y2 = cannon.y + lengthdir_y(cannon.openValue - cannonFireOffset, engine.imageAngle + 90);

propeller.x = xx + lengthdir_x(propeller.dis, image_angle + 180);
propeller.y = yy + lengthdir_y(propeller.dis, image_angle + 180);

var prop = engine.propEngine;

prop.x = engine.x + lengthdir_x(prop.dis, engine.imageAngle + prop.angle);
prop.y = engine.y + lengthdir_y(prop.dis, engine.imageAngle + prop.angle);

prop.rot = (prop.rot + 10) mod 180;
propeller.rot = (propeller.rot + 7) mod 180;

switch(jaw.state) {
	case "snap":
		if (jaw.closeLerp < 1) {
			jaw.closeLerp += .05;
			jaw.closeAngle = ease_lerp(EASE.OutElastic, 0, 1, jaw.closeLerp);
		} else {
			jaw.state = "wait";
			jaw.wait = .5 * room_speed;
		}
		break;
		
	case "wait":
		if (jaw.wait > 0) jaw.wait-- else {
			jaw.state = "opening";
			jaw.closeLerp = 0;
		}
		break;
		
	case "opening":
		if (jaw.closeLerp < 1) {
			jaw.closeLerp += .025;
			jaw.closeAngle = ease_lerp(EASE.OutBounce, 1, 0, jaw.closeLerp);
		} else {
			jaw.state = "open";	
		}
		break;
		
	case "clapShut":
		if (jaw.closeLerp < .8) {
			jaw.closeLerp += .1;	
			jaw.closeAngle = ease_lerp(EASE.OutElastic, 0, 1, jaw.closeLerp);
		} else {
			jaw.state = "clapOpen";	
		}
		break;
		
	case "clapOpen":
		if (jaw.closeLerp > 0) {
			jaw.closeLerp -= .2;
			jaw.closeAngle = ease_lerp(EASE.OutCubic, 0, 1, jaw.closeLerp);
		} else {
			if (dying || jaw.clapCount < 2) {
				jaw.clapCount++;
				jaw.state = "clapShut";
			} else {
				jaw.state = "open";	
			}
		}
		break;
}

switch(cannon.state) {
	case "opening":
		if (cannon.openLerp < 1) {
			cannon.openLerp += .05;
			cannon.openValue = ease_lerp(EASE.OutElastic, 0, cannon.openOffset, cannon.openLerp);
		}
		break;
		
	case "closing":
		if (cannon.openLerp < 1) {
			cannon.openLerp += .05;
			cannon.openValue = ease_lerp(EASE.OutCirc, cannon.openOffset, 0, cannon.openLerp);
		} else {
			cannon.state = "closed";	
		}
		break;
}

