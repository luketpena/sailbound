var offset = rotMain.getDisY();

draw_set_color(c_white);
draw_sprite_pos(
	sprite_index, image_index,
	pos1.x, pos1.y,
	pos2.x, pos2.y,
	pos3.x + offset, pos3.y,
	pos4.x + offset, pos4.y,
	1
);