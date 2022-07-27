waterY = water_find_y_basic(x);

switch(state) {
	case "launch":
		submerged = phy_position_y + 24 > waterY;
		if (moveSpeed > -targetMoveSpeed) {
			test();
			moveSpeed -= .1;	
		}
		if (!submerged) {
			state = "fall";	
		}
		break;
		
	case "fall":
		submerged = phy_position_y > waterY;
		if (moveSpeed < targetMoveSpeed) moveSpeed += .1;
		if (submerged && moveSpeed > 0) {
			explode();	
		}
}

phy_position_y += moveSpeed;

if (moveSpeed < -1) {
	image_index = 0;	
} else if (moveSpeed > 1) {
	image_index = 6;	
} else {
	image_index = lerp(0, 6, (moveSpeed * .5) + .5);
}
