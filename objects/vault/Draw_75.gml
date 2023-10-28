if (loading_cooldown > 0) {
	loading_cooldown--;
	draw_sprite_ext(s_ui_loading, 0, global.vw - 8, global.vh - 8, 1, 1, 0, c_white, 1);
}