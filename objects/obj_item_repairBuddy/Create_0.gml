state = "appear";
anim_index = 0;
anim_sprite = spr_item_repairBuddy_appear;

healing_count = 16;
healing_wait_set = 1*room_speed;
healing_wait = healing_wait_set;

move_offset_x = 0;
move_offset_y = 0;

function facing_direction() {
	if (x>global.boat_x) image_xscale = -1 else image_xscale = 1;
}