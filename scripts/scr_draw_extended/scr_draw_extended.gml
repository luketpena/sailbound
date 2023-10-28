///@description Draws all of the sprites from a named asset layer
///@param {String} layer_name
///@param {Real} x_offset 
///@param {Real} y_offset
function draw_asset_layer_sprites(_layer_name, _x_offset = 0, _y_offset = 0) {
	var a = layer_get_all_elements(_layer_name);
	for (var i = 0; i < array_length(a); i++;) {
		if (layer_get_element_type(a[i]) == layerelementtype_sprite) {
			var _spr = layer_sprite_get_sprite(a[i]);
			var _ind = layer_sprite_get_index(a[i]);
			var _x = layer_sprite_get_x(a[i]);
			var _y = layer_sprite_get_y(a[i]);
			draw_sprite(_spr, _ind, _x + _x_offset, _y + _y_offset);
		}
	}	
}