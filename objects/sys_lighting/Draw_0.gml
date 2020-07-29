if (step=0) {
	step = 1;
	if surface_exists(light_surface) {
		//>>drawing the light surface
		surface_set_target(light_surface);
			draw_clear_alpha(c_black,1);
		
			var vx = global.vx;
			var vy = global.vy;
		
			for (var i=0; i<instance_number(prnt_light); i+=1) {
				var light = instance_find(prnt_light,i);
				draw_sprite_ext(
					light.sprite_index,
					light.image_index,
					light.x-vx,
					light.y-vy,
					light.image_xscale,
					light.image_yscale,
					light.image_angle,
					light.image_blend,
					light.image_alpha);
			}
		surface_reset_target();
		global.light_texture = surface_get_texture(light_surface);

	} else {
		//>>creating the light surface
		light_surface = surface_create(width,height);
	}
} else {
	step = 0;	
}