if (cluster) {
	flyTowardsCenter();
	avoidOthers();
	matchVelocity();
	matchSpeed();
	keepWithinBounds();
	correctToHorizontal();
	if (cluster.targetActive) {
		moveTowardsTarget();
	}
}

image_angle = point_direction(0, 0, dx, dy);

x += dx;
y += dy;

if (x > room_width) x -= room_width;
if (x < 0) x += room_width;
//if (y < 0) y += room_height;
//if (y > room_height) y -= room_height;