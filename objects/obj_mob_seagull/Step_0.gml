switch(state) {
	case "flyToPlayer":
		moveToPlayer();
		var inRangeH = abs(o_boat_main.x_center_draw - x) < attackRange;
		var inRangeV = o_boat_main.y_center_draw > y + 4;
		if (inRangeH && inRangeV && !o_boat_main.submerged) {
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