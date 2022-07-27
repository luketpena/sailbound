if (!completedAttack) {
	switch(carryObject) {
		case SeagullCarryObject.Coconut:
			draw_sprite_ext(spr_coconut, 0, x, y + 12, 1, 1, 0, c_front, 1);
			break;
	}
}

draw_sprite_ext(sprite_index, image_index, x, y, face, 1, 0, c_front, 1);