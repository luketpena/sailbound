if (instance_exists(obj_boat_front) && instance_exists(obj_boat_draw)) {
	x = obj_boat_front.x_center_draw;
	y = obj_boat_front.y_center_draw;
	image_angle = obj_boat_draw.hull_angle;
}


if (bounceDelay > 0) bounceDelay-- else {
	var queueLength = array_length(collideQueue);
	if (queueLength > 0) {
		// Iterate over the queue
		for (var i=0; i<queueLength; i++) {
			var marker = collideQueue[i];
			var colliding = physics_test_overlap(phy_position_x, phy_position_y, phy_rotation, marker.instance);
			if (!colliding || !instance_exists(marker.instance)) {
				array_delete(collideQueue, i, 1);
				// After deletion, the whole array is wack, so start over
				break;
			} else {
				marker.collisionFunction(marker.instance, true);
				bounceDelay = bounceDelaySet;	
			}
		}
	
	}
}
