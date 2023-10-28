var savedActive = active;
active = global.targetLevel == id;

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

draw_set_style(global.font_normal_medium, c_gold, fa_center, fa_bottom, 1);