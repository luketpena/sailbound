if (protoActive) {
	if (o_town_player.phy_speed_y >= 0) {
		protoActive = false;
		active = true;
		myBlock.phy_active = true;
		instance_activate_object(myBlock);
	}
}