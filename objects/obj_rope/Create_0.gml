root = noone;
index = -1;

function grab() {
	if (root && instance_exists(root)) {
		root.grab(index);	
	}
}

function push(xforce) {
	physics_apply_force(phy_position_x, phy_position_y, xforce, 0);	
}