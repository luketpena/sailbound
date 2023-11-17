
switch(state) {
	case "swim":
		x += move.speed * face;
		if (cooldown > 0) cooldown--
		else if (distanceFromBoat(x, y) < range) {
			state = "prepareAttack";
			stateTimer = .2 * room_speed;
		}
		
		rot += rotRate;
		y = ystart + lengthdir_y(rotDis, rot);
		break;
		
	case "prepareAttack":
		if (stateTimer > 0) stateTimer-- else {
			state = "attack";
			stateTimer = .5 * room_speed;
			attackAnimLerp = 0;
			impact = false;
		}
		break;
		
	case "attack":
		if (attackAnimLerp < 1)
			then attackAnimLerp += attackAnimRate
			else {
				state = "holdAttack";
				stateTimer = .5 * room_speed;
			}
			var inRange = distanceFromBoat(x, y) < (range * attackAnimLerp);
			if (inRange && !impact) {
				impact = true;
				impactPlayer(20, -6, 1);
			}
		break;
		
	case "holdAttack":
		if (stateTimer > 0) stateTimer-- else {
			state = "revertToSwim";
			attackAnimLerp = 0;
		}
		var inRange = distanceFromBoat(x, y) < range;
			if (inRange && !impact) {
				impact = true;
				impactPlayer(1, -2, .5);
			}
		break;
		
	case "revertToSwim":
		if (attackAnimLerp < 1)
			then attackAnimLerp += attackAnimRate
			else {
				state = "swim";
				cooldown = 3 * room_speed;
			}
		break;
}


if (instance_exists(ground)) {
	var groundTarget = ground.findY(x, .5);

	if (groundTarget - y < 8) {
		y--;
	}
}

switch(face) {
	case 1:
		if (x > room_width) instance_destroy();
		break;
	case -1:
		if (x < 0) instance_destroy();
		break;
}