active = true;
myBlock = instance_create_layer(x, y, layer, o_block_fallthru);
protoActive = false;


function toggle() {
	switch(active) {
		case true:
			if (o_town_player.bottom-1 > y || o_town_player.fallthru_active) {
				active = false;
				myBlock.phy_active = false;
				instance_deactivate_object(myBlock);
			}
			break;
		case false:
			if (o_town_player.bottom-1 < y && !o_town_player.fallthru_active) {
			
				if (o_town_player.phy_speed_y < 0) {
					protoActive = true;	
				} else {
					active = true;
					myBlock.phy_active = true;
					instance_activate_object(myBlock);	
				}	
			}
			break;
	}	
}