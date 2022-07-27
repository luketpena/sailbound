if (active) {
	if (life > 0) life-- else {
		instance_destroy();
	}
	image_alpha = life / life_set;
	image_index = lerp(image_number - 1, 0, image_alpha);
	image_angle += 2 * flip;
	
	if (moveSpd > 0) moveSpd *= .95;
	x += lengthdir_x(moveSpd, moveDir);
	y += lengthdir_y(moveSpd, moveDir);
}