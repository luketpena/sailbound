player_pos_real = floor( (o_town_player.bottom-1) / 32);
if (player_pos_tracked != player_pos_real) {
	player_pos_tracked = player_pos_real;
	with(obj_block_fallthru_host) toggle();
}

if (fallthru_tracked != o_town_player.fallthru_active) {
	fallthru_tracked = o_town_player.fallthru_active;
	with(obj_block_fallthru_host) toggle();
}