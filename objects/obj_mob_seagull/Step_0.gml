switch(state) {
	case "flyToPlayer":
		moveToPlayer();
		var inRangeH = abs(obj_boat_front.x_center_draw - x) < attackRange;
		var inRangeV = obj_boat_front.y_center_draw > y + 4;
		if (inRangeH && inRangeV && !obj_boat_front.submerged) {
			state = "prepareAttack";
			stateTimer = .2 * room_speed;
		}
		break;
		
	case "prepareAttack":
		if (stateTimer > 0) stateTimer -- else {
			state = "holdAttack";
			stateTimer = 1.5 * room_speed;
			completedAttack = true;
			cleanDanger(MobDanger.Seagull);
			sprite_index = spr_mob_seagull_fly;
			
			dropItem();
		}
		break;

	case "holdAttack":
		if (stateTimer > 0) stateTimer -- else {
			state = "flyOffscreen";
		}
		break;
		
	case "flyOffscreen":
		moveOffscreen();
		break;
}