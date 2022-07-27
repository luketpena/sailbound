var savedActive = active;
active = point_distance(x, y, obj_map_playerIcon.x, obj_map_playerIcon.y) < range;

if (savedActive != active) {
	scaleLerp = active ? 0 : 1;	
}

if (active && scaleLerp < 1) {
	scaleLerp += .02;
	scale = ease_lerp(EASE.OutElastic, 1, 1.2, scaleLerp);
}

if (!active && scaleLerp > 0) {
	scaleLerp -= .02;
	scale = ease_lerp(EASE.InElastic, 1, 1.2, scaleLerp);
}

if (active && gamepad_button_check_pressed(0, gp_face3)) {
	interact();	
}