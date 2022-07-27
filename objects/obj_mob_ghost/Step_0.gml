var pdir = point_direction(x, y, global.boat_x, global.boat_y);

switch(state) {
	case "chase":
		if (fadeOutTimer > 0) fadeOutTimer-- else {
			state = "fadeOut";
		}
		
		face = (floatMove.xspeed > 0) ? 1 : -1;
		
		floatMove_move_dir(pdir);

		//var xlimit = lengthdir_x(maxSpeed, pdir);
		//var ylimit = lengthdir_y(maxSpeed, pdir);
		//if (!(xlimit > 0 && xspeed > xlimit) && !(xlimit < 0 && xspeed < xlimit)) {
		//	xspeed += lengthdir_x(.05, pdir);
		//}

		//if (!(ylimit > 0 && yspeed > ylimit) && !(ylimit < 0 && yspeed <ylimit)) {
		//	yspeed += lengthdir_y(.05, pdir);
		//}
		if (point_distance(x, y, global.boat_x, global.boat_y) < range) {
			sprite_index = spr_mob_ghost_attack;
			state = "attack";
			attackReady = true;
			attackHit = false;
		}
		break;
		
	case "attack":
		var index = floor(image_index);
		
		if (index < 8) {
			face = (global.boat_x > x) ? 1 : -1;
			floatMove_slow(.95);
		} else if (index = 8 && attackReady) {
			attackHitbox = instance_create_layer(x, y, layer, obj_mob_ghost_attack_hitbox);
			attackHitbox.init(pdir, id);
			attackReady = false;
			floatMove_speed_set_dir(pdir, lungeSpeed);
		} else {
			var hitboxExists = instance_exists(attackHitbox);
			if (hitboxExists) {
				if (index >= 12) {
					instance_destroy(attackHitbox);	
				} else {
					attackHitbox.phy_position_x = x;
					attackHitbox.phy_position_y = y;
				}
			}
			floatMove_slow(.98);	
		}
		break;
		
	case "laugh":
		floatMove_slow(.98);	
		if (stateTimer > 0) stateTimer-- else {
			state = "fadeOut";	
		}
		break;
		
	case "fadeOut":
		floatMove_slow(.98);	
		if (image_alpha > 0) image_alpha -= .01 else {
			state = "fadeIn";
			sprite_index = spr_mob_ghost_float;
			x = random(room_width);
			y = global.water_y + random_range(-128, 96);
			floatMove_stop();
			face = (global.boat_x > x) ? 1 : -1;
		}
		break;
		
	case "fadeIn":
		if (image_alpha < 1) image_alpha += .01 else {
			state = "chase";
			setFadeOutTimer();
		}
		break;
}

floatMove_apply();
