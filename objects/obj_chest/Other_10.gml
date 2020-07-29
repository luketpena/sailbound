/// @description Open

open = true;
image_speed = 1;
phy_speed_y = 1;
impact_lock = 1;
flash = .5;

switch(chest_type) {
	case chests.bronze:
		glow_width = 9;
		glow_x = -4;
		break;
	case chests.silver:
		glow_width = 13;
		glow_x = -6;
		break;
	case chests.gold:
		glow_width = 17;
		glow_x = -8;
		break;
}