var savedActive = active;
active = o_map_player.activeLevel == id;

if (savedActive != active) {
	scaleLerp = active ? 0 : 1;	
}

if (active && scaleLerp < 1) {
	scaleLerp += .02;
	scale = ease_lerp(EASE.OutElastic, .8, 1, scaleLerp);
}

if (!active && scaleLerp > 0) {
	scaleLerp -= .02;
	scale = ease_lerp(EASE.InElastic, .8, 1, scaleLerp);
}

// Starting the level
if (active) {
	if (gamepad_button_check_pressed(0, gp_face3) || keyboard_check_pressed(vk_space)) {
		interact();	
	}
}


draw_set_style(global.font_normal_medium, c_gold, fa_center, fa_bottom, 1);
