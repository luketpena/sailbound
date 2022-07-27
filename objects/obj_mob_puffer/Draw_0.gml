switch(state) {
	case "swim":
	case "prepareAttack":
		draw_sprite_ext(sprite_index, image_index, x, y, face, 1, image_angle, c_front, 1);
		break;
		
	case "attack":
	case "holdAttack":
		var scale = .5 + (.5 * attackAnimLerp);
		draw_sprite_ext(spr_mob_puffer_puffed, image_index, x, y, face * scale, scale, image_angle, c_front, 1);
		break;
		
	case "revertToSwim":
		var scale = 1 - (.5 * attackAnimLerp);
		draw_sprite_ext(spr_mob_puffer_puffed, image_index, x, y, face * scale, scale, image_angle, c_front, 1);
		break;
}
//draw_sprite_ext(sprite_index, image_index, x, y, face, 1, image_angle, c_front, 1);
//draw_sprite_ext(spr_testRing, image_index, x, y, 1, 1, image_angle, c_front, 1);

