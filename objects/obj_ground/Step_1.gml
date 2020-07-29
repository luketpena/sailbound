if (active) {
	switch(state) {
		case "enter":
			if (phy_position_x>room_hwidth) phy_position_x -= move_speed else state = "static";
			break;
			
		case "static":
			tex_offset -= move_speed;
			break;
			
		case "exit":
			if (phy_position_x+room_hwidth>0) phy_position_x -= move_speed else instance_destroy();
	}
}