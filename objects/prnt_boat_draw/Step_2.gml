lighting_flash_step();

sailor_angle = (flip = 1 ? hull_angle : (hull_angle - 180)) * .5;
head.step();
sailStep();

if (updateBlending) image_blend = c_front;

if (hasBoatTarget) {
	x = obj_boat_front.x_center_draw;
	y = obj_boat_front.y_center_draw;

	squish += (1+(obj_boat_front.phy_speed_y/20)-squish)*.2;
	hull_angle = obj_boat_front.boat_angle_reverse-180;

	if (dmgFlicker_alarm>-1) {
		if (dmgFlicker_alarm>0) {
			dmgFlicker_alarm--;
			if (dmgFlicker_flip_alarm>0) dmgFlicker_flip_alarm-- else {
				dmgFlicker_flip_alarm = .1 * room_speed;
				dmgFlicker_flip = !dmgFlicker_flip;
			}
		} else {
			dmgFlicker_alarm = -1;
			dmgFlicker_flip = false;
			global.boat_canDamage = true;
		}
	}
}
