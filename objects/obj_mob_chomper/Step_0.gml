behave_step_floater(true);
floater_step(idle_offset);

//---- Behavior ----\\
switch(state) {
	//This state makes sure it cannot start moving until it is in camera
	case "start":
		if (global.vb > y && global.vy < y) state = "swim";
		break;
		
	case "swim":
		//Lower itself in the water
		if (idle_offset < idle_offset_max) idle_offset += .25;
		
		//Only can affect hspeed when touching the water
		if (touched) {
			if (move_speed < move_speed_max) move_speed += .05
			else if (move_speed > move_speed_max) move_speed *= .93;
		}
		
		if (!success) {
			//Checking if player is in range horizontally and vertically
			var h_check = (global.boat_x > x+h_range_left && global.boat_x < x+h_range_right);
			var v_check = (global.boat_y > y-v_range && global.boat_y < y+v_range);
		
			//If in range, trigger the attack
			if (h_check && v_check) {
				state = "attack";
				attack_impact = false;
				image_index = 0;
				sprite_index = spr_mob_chomper_normal_bite;
			}
		}
		break;
		
	case "attack":
		//Raise itself up in the water
		if (idle_offset > 0) idle_offset -= .5;
		
		//Before and after the attack
		if (attacking) {
			//Slowing down after attack has triggered
			move_speed *= .96;
		} else {
			
			//Slowing down / backing up
			if (move_speed > -.5) move_speed -= .1;
			
			// Triggering the attack 1 frame before the bite
			if (floor(image_index) = 9) {
				attacking = true;
				move_speed = 10;
				water_splash_create_single(x, -face, "medium");
			}
		}
		break;
}

// Incrementing position based on speed and direction, taking slope of wave into account
var waterLeft = water_find_y_basic(x - 8);
var waterRight = water_find_y_basic(x + 8);
var slopeLerpValue = min(abs(waterLeft - waterRight) / 32, 1);
var slopeMultiplier = lerp(1, .2, slopeLerpValue);
phy_position_x += move_speed * face * slopeMultiplier;

// Despawn off screen
switch(face) {
	case 1:
		if (phy_position_x > room_width) {
			instance_destroy();	
		}
		break;
	case -1:
		if (phy_position_x < 0) {
			instance_destroy();	
		}
}