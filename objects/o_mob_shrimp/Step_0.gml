switch(state) {
	case "SWIM":
		image_xscale = floatMove.xspeed > 0 ? 1 : -1;
		if (targetTimer > 0 && point_distance(x, y, target.x, y) > 32) targetTimer-- else {
			targetTimer = random_range(1, 3) * room_speed;
			targetRandomPosition();
		}
		floatMove_move_point(target.x, target.y);
		floatMove_apply();
		
		if (stateTimer > 0) stateTimer-- else {
			target.x = x;
			state = "RISE"	
		}
		break;
		
	case "RISE":
		stayAtSurface();
		
		if (abs(target.y - y) < 2) {
			state = "AIM";	
			stateTimer = random_range(1, 3) * room_speed;
		}
		break;
		
	case "AIM":
		stayAtSurface();
		if (stateTimer > 0) stateTimer-- else {
			state = "FIRE";
			var coconut = instance_create_layer(x, y, layer, obj_coconut);
			var dis = point_distance(x, y, boat.x, boat.y) / global.hvw;
			var pwr = lerp(2, 6, dis);
			var offset = lerp(8, 128, dis);
			var aimDir = point_direction(x, y, boat.x, boat.y - offset) + random_range(-5, 5);
		
			coconut.phy_speed_x = lengthdir_x(pwr, aimDir);
			coconut.phy_speed_y = lengthdir_y(pwr, aimDir);
		}
		break;
		
	case "FIRE":
		stayAtSurface();
		// TODO: Animation here
		state = "WAIT";
		stateTimer = 2 * room_speed;
		break;
		
	case "WAIT":
		stayAtSurface();
		if (stateTimer > 0) stateTimer-- else {
			state = "SINK";
			target.y = global.water_y + 64;
			sinkAccel = -2;
		}
		break;
		
	case "SINK":
		y += sinkAccel;
		if (sinkAccel < 3) sinkAccel += .2;
		if (target.y - y < 0) {
			state = "SWIM";
			yspeed = sinkAccel;
			stateTimer = random_range(2, 8) * room_speed;
			targetRandomPosition();
		}
		break;
}


