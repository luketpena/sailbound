if (active) {

	if (!targetActive) {
		if (targetTimer > 0) targetTimer-- else {
			targetTimer = irandom_range(1, 5) * room_speed;
			targetActive = true;
			setTarget();
		}
	}

	for (var i=0; i<count; i++) {
		var boid = children[i];
		var blend = merge_color(c_front, c_water_depth, .8 *(1 - (i/count)));
		var flip = 1;
		if (boid.image_angle > 90 && boid.image_angle < 270) {
			flip = -1;	
		}
		draw_sprite_ext(config.spriteIndex, 0, boid.x, boid.y, 1, flip, boid.image_angle, blend, 1);
	}
}