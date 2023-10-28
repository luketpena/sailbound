draw_stacked_sprite(sprite_index, x, y, z, c_front, scale);

for (var i=0; i<array_length(hullLost); i++) {
	var _id = hullLost[i];
	draw_billboard_sprite(catalogue_ships[$ _id].orbSprite, 0, x, y, 1, 1, 0, c_white, 1);
}