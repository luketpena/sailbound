///@description Water Texture

if surface_exists(water_surface) {
	
	surface_set_target(water_surface);

		//Draw the surface color
		draw_clear_alpha(c_water_surface, 1);
		//Drawing the dividing line
		draw_sprite_ext(s_pixel, 0, 0, settings.water_depth-1, room_width, 1, 0, c_water_highlight, 1);
		//Draw the floating pattern
		draw_sprite_tiled_ext(spr_env_water_pattern, 1, -pattern_pos, 0, 1, 1, c_water_highlight, .25);
		draw_sprite_tiled_ext(spr_env_water_pattern, 0, -pattern_pos*1.5, 0, 1, 1, c_water_highlight, .5);
		

		//Drawing the waves
		for (var i=0; i<sys_water.waveConfig.count; i++) {
			var wave = sys_water.waveList[i];
			if (wave.active) {
				draw_sprite_ext(spr_env_water_wave_front, wave_anim, wave.x, 0, 1, 1, 0, c_water_highlight, 1 * global.motion);	
			}
		}	
	
		draw_tag("fx_surface");
		
		var float_count = instance_number(obj_floater);
		for (var i=0; i<float_count; i++) {
			var o = instance_find(obj_floater, i);
			draw_sprite_ext(o.sprite_index, 0, o.x, global.water_center_y, o.image_xscale, o.image_yscale, 0, c_water_highlight, 1);
		}
		
		var shadow_count = instance_number(obj_shadow);
		for (var i=0; i<shadow_count; i++) {
			var o = instance_find(obj_shadow, i);
			draw_sprite_ext(o.sprite_index, 0, o.x, global.water_center_y, o.image_xscale, o.image_yscale, 0, c_water_depth, .5);
		}
		
		part_system_drawit(global.ps_water_surface);
		
	surface_reset_target();	
	global.water_texture = surface_get_texture(water_surface);
	
} else {
	water_surface = surface_create(room_width, settings.water_depth);
}
