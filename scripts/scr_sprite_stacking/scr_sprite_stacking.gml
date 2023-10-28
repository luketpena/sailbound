function draw_stacked_sprite(_sprite_index, _x, _y, _z, _image_blend, _scale = 1) {
	var _zscale = o_map_camera.image_zscale * _scale;
		
	for (var i=0; i<sprite_get_number(_sprite_index); i += 1/_zscale) {
		draw_sprite_ext(
			_sprite_index, i,
			_x - (o_map_camera.xstep * i * _zscale),
			_y - (o_map_camera.ystep * i * _zscale) - _z,
			_scale, _scale, image_angle, _image_blend, 1
			);	
	}
}

function draw_billboard_sprite(_sprite_index, _image_index, _x, _y, _image_xscale, _image_yscale, _image_angle, _image_blend, _image_alpha) {
	var _yscale = _image_yscale * o_map_camera.billboard_yscale;
	draw_sprite_ext(_sprite_index, _image_index, _x, _y, _image_xscale, _yscale, _image_angle - global.camAngle + 90, _image_blend, _image_alpha);
}

function draw_billboard_text(_x, _y, _string, _verticalOffset = 0) {
	draw_text_transformed(
		_x + o_map_camera.xstep * _verticalOffset * o_map_camera.image_zscale,
		_y + o_map_camera.ystep * _verticalOffset * o_map_camera.image_zscale,
		_string, 1,
		o_map_camera.billboard_yscale,
		- (global.camAngle - 90)
	);
}


function compute_3d_depth(_x, _y, _z) {
	var _depth = _x * o_map_camera.xstep +
				 _y * o_map_camera.ystep +
				 _z;
				 
	return -1 * _depth;
}

function ds_grid_delete_row(_grid, _row) {
	var _width = ds_grid_width(_grid);	
	var _height = ds_grid_height(_grid);
	
	ds_grid_set_grid_region(_grid, _grid, 0, _row+1, _width-1, _height-1, 0, _row);
	ds_grid_resize(_grid, _width, _height-1);
}