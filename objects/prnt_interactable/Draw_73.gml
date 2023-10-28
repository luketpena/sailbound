if (!disabled && active && o_town_player.active) {
	draw_sprite_ext(spr_gp_x, 0, x, y, 1, 1, 0, c_white, 1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_alpha(1);
	draw_text(x + 4, y - 32, interactMessage);
}