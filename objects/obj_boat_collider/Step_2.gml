if (instance_exists(o_boat_main) && instance_exists(prnt_boat_draw)) {
	x = o_boat_main.x_center_draw;
	y = o_boat_main.y_center_draw;
	image_angle = prnt_boat_draw.hull_angle;
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
