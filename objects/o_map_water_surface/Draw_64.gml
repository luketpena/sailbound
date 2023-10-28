if (
	surface_exists(surf_ping) &&
	surface_exists(surf_pong) &&
	surface_exists(surf_blurred) && 
	surface_exists(surf_posterize) && 
	surface_exists(surf_distort_tex) &&
	surface_exists(surf_distort)
) {
	// Draws an initial blank surface with the elevation asset layers drawn to it (no blur)
	surface_set_target(surf_ping);
		draw_clear_alpha(c_dkgray, 1);
		draw_asset_layer_sprites("l_elevation_mid", -x, -y);
		draw_asset_layer_sprites("l_elevation_high", -x, -y);
	surface_reset_target();
	
	// Then, we blur the layer, passing it first to a 
	gpu_set_tex_filter(true);
		shader_set(shd_blur_glow);
			shader_set_uniform_f(u_blur_steps, blur_steps);
			shader_set_uniform_f(u_texel_size, texel_w, texel_h);
			shader_set_uniform_f(u_sigma, sigma);
		
			// Blur: 1st pass
			shader_set_uniform_f(u_blur_vector, 1, 0);
			surface_set_target(surf_pong);
				draw_surface_ext(surf_ping, 0, 0, 1, 1, 0, c_white, 1);
			surface_reset_target();
				
			// Blur: 2nd pass
			shader_set_uniform_f(u_blur_vector, 0, 1);
			surface_set_target(surf_blurred);
				draw_surface_ext(surf_pong, 0, 0, 1, 1, 0, c_white, 1);
			surface_reset_target();
			
		shader_reset();
	gpu_set_tex_filter(false);
	
	// Create distortion surface, get the texture
	surface_set_target(surf_distort_tex);
		draw_clear_alpha(c_black, 1);
		var _yy = - o_map_player.y;
		var _xx = - o_map_player.x;
		gpu_set_blendmode(bm_add);
			draw_sprite_tiled_ext(spr_fx_water_distortion, 0, _xx, _yy, 1, 1, c_white, .5);
			draw_sprite_tiled_ext(spr_fx_water_distortion, 0, _xx + distort_x, _yy, 2, 2, c_white, .5);
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
	distort_tex = surface_get_texture(surf_distort_tex);
	
	// Apply distortion shader
	if (distort_tex != noone) {
		surface_set_target(surf_distort);
			gpu_set_tex_filter_ext(u_distort_tex, true);

			shader_set(shd_textureDistortion);
				texture_set_stage(u_distort_tex, distort_tex);
				draw_surface_ext(surf_blurred, 0, 0, 1, 1, 0, c_white, 1);
			shader_reset();

			gpu_set_tex_filter(false);
		surface_reset_target();
	} 
	
	// Posterize the output to get reduced color ramps
	surface_set_target(surf_posterize);
		shader_set(shd_posterize);
			draw_surface(surf_distort, 0, 0);
		shader_reset();
	surface_reset_target();	
} else {
	// Creating all surfaces, if they do not yet exists
	if (!surface_exists(surf_ping)) surf_ping = surface_create(width, width);	
	if (!surface_exists(surf_pong)) surf_pong = surface_create(width, width);	
	if (!surface_exists(surf_blurred)) surf_blurred = surface_create(width, width);	
	if (!surface_exists(surf_posterize)) surf_posterize = surface_create(width, width);	
	if (!surface_exists(surf_distort_tex)) surf_distort_tex = surface_create(width, width);	
	if (!surface_exists(surf_distort)) surf_distort = surface_create(width, width);	
}

