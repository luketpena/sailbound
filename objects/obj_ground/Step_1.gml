distanceToCenter = phy_position_x-room_hwidth;

function itemStep(array) {
	for (var i=0; i<array_length(array); i++) {
		var item = array[i];
		if (item.wait=0) {
			item.x -= move_speed;
			if (item.x<item_left) {
				item.x = item_right;
				item.wait = irandom(3*room_speed);
			}
		} else item.wait--;
	}	
}

if (active) {
	switch(state) {
		case "enter":
			if (distanceToCenter>0) phy_position_x -= move_speed else state = "static";
			break;
			
		case "static":
			tex_offset -= move_speed;
			
			itemStep(item_array);
			itemStep(itemF_array);			

			break;
			
		case "exit":
			if (phy_position_x+hlength>0) phy_position_x -= move_speed else instance_destroy();
	}
}


