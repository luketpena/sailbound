if (surface_exists(surf)) {
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
		for (var i=0; i<instance_number(o_map_env_cloud); i++) {
			var _cloud = instance_find(o_map_env_cloud, i);
			draw_sprite_ext(
				_cloud.sprite_index, _cloud.image_index,
				_cloud.x - o_map_player.x,
				_cloud.y  - o_map_player.y,
				_cloud.image_xscale,
				_cloud.image_yscale,
				_cloud.image_angle,
				c_white, 1
			);
		}
	surface_reset_target();
	
	var _hw = size / 2;
	gpu_set_blendmode(bm_add);
		draw_surface_ext(surf, o_map_player.x - _hw + offset_x, o_map_player.y - _hw + offset_y, 1, 1, 0, c_front, alpha);
	gpu_set_blendmode(bm_normal);
} else {
	surf = surface_create(size, size);	
}