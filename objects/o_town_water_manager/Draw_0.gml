if (surface_exists(global.cutout_top_surface)) {
	surface_set_target(global.cutout_top_surface);
		draw_clear(c_white);
		gpu_set_blendmode(bm_subtract);
			var waterBlockCount = instance_number(o_town_water);
			for (var i=0; i<waterBlockCount; i++) {
				var block = instance_find(o_town_water, i);
				block.drawCutout();
			}
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
} else {
	global.cutout_top_surface = surface_create(room_width, global.vh);		
}