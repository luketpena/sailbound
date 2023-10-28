triggered = false;
if (!disabled && active && o_town_player.active && input.town.interact.pressed) {
	if (!is_undefined(interact)) {
		interact();	
	}
	triggered = true;
}