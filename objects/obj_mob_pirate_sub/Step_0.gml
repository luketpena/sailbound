collider.phy_position_x = x;
collider.phy_position_y = y;

puppet.x = x;
puppet.y = y;

switch(state) {
	case "attacking":
		if (moveTimer > 0) moveTimer-- else {
			setMoveTimer();
			setTargetPos();
		}

		if (attackTimer > 0) attackTimer-- else {
			if (ammoCount > 0) {
				fireTorpedo();
			} else {
				state = "rising";
				setTargetPos(x, global.water_y);
			}
		}
		floatMove_move_point(global.boat_x, targetPos.y);
		
		if (puppet.jaw.state = "open" && distanceFromBoat(x + 32, y) < 32) {
			boat_damage(4, 0, 5, 3);
			puppet.snapJaw();
		}
		break;
		
	case "rising":
		var distanceToSurface = y - targetPos.y;
		if (distanceToSurface < 8) {
			state = "resting";
			stateTimer = 3 * room_speed;
			collider.active = true;
			puppet.exposeCannon();
		} else {
			floatMove_move_point(targetPos.x, targetPos.y);	
		}
		break;
		
	case "resting":
		floatMove_slow(.9);
		y += (targetPos.y - y) * .1;
		if (stateTimer > 0) stateTimer-- else {
			sink();
		}
		break;
		
	case "sinking":
		floatMove_move_point(targetPos.x, targetPos.y);
		var distanceToDepth = targetPos.y - y;
		if (distanceToDepth < 8) {
			state = "attacking";
			setTargetPos();
			reloadTorpedo();
		}
		break;
		
	case "dying":
		floatMove_move_point(targetPos.x, targetPos.y);
		if (koTimer > 0) koTimer-- else {
			instance_destroy();	
		}
		break;

}
floatMove_apply();
