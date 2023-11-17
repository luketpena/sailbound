array_foreach(backLegs, function(_leg, _index) {
	draw_sprite_ext(s_magmaCrab_legs, 0, _leg.drawX, _leg.transitionY, 1, _leg.spriteFlip, _leg.angle, c_white, 1);
});


draw_sprite_ext(sprite_index, 0, walker.x, walker.y - 16, 1, 1, 0, c_white, 1);

array_foreach(frontLegs, function(_leg, _index) {
	draw_sprite_ext(s_magmaCrab_legs, 1, _leg.drawX, _leg.transitionY, 1, _leg.spriteFlip, _leg.angle, c_white, 1);
});
