if (mouse_check_button_pressed(mb_left)) {
	move_toPlayer(random_range(-32, 32));
}

if (mouse_check_button_pressed(mb_right)) {
	facePoint(mouse_x)
}

if (targetActive) {
	facePoint(targetX);
	isWalking = abs(x - targetX) > maxMoveSpeed;

	var moveOffset = (maxMoveSpeed + 4 * face);
	walled = collision_rectangle(x - 8 + moveOffset, y - 8, x + 8 + moveOffset, y, prnt_block, false, true);
	stopped = collision_rectangle(x - 8 + moveOffset, y - 8, x + 8 + moveOffset, y, obj_block_stop, false, true);

	if (isWalking && !stopped && !walled) {
		moveSpeed = maxMoveSpeed * face;
	} else {
		targetActive = false;
		moveSpeed = 0;
		snapToGround();
	}

	if (moveSpeed != 0) {
		var range = (8 * face) + moveSpeed;
		var moveDis = collision_impact_rectangle_h(range, -1, y-8, y, x, prnt_block, true);
		x = moveDis - (8 * face);
		snapToGround();
	}
}

if (puppet != null) {
	puppet.y += (y - puppet.y) * .5;
	puppet.x += (x - puppet.x) * .2;
	puppet.isWalking = (moveSpeed != 0);
	puppet.face = face;
}
