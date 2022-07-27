x += lengthdir_x(moveSpeed, image_angle);
y += lengthdir_y(moveSpeed, image_angle);

shadow.x = x;
shadow.y = y;
shadow.image_angle = image_angle;

if (targetTimer > 0) targetTimer-- else {
	targetTimer = random_range(targetTimerMin, targetTimerMax);
	target = instance_nearest(x, y, prnt_map_levelSelect);
	targetX = target.x + random_range(-targetRadius, targetRadius);
	targetY = target.y + random_range(-targetRadius, targetRadius);
}

image_angle += angle_difference(point_direction(x, y, targetX, targetY), image_angle) * turnRate;