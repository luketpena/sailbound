distortionShader_prepareTexture(function() {
	var yy = 0;
	gpu_set_blendmode(bm_add);
		draw_sprite_tiled_ext(spr_fx_water_distortion, 0, tex_x * 2, yy, 1, .25, c_white, .5);
		draw_sprite_tiled_ext(spr_fx_water_distortion, 0, tex_x, yy, 2, .5, c_white, .5);
	gpu_set_blendmode(bm_normal);
});	

if (surface_exists(surf)) {
	surface_set_target(surf);		
		draw_sprite_tiled_ext(s_caveBackdrop_test, 0, offset * .5, 0, 1, 1, c_front, 1);
		
		draw_sprite_tiled_ext(s_magmaCave_bg, 0, offset * .75, 0, 1, 1, c_front, 1);
		gpu_set_blendmode(bm_add);
		draw_primitive_begin(pr_trianglestrip)
			draw_vertex_color(0, global.hvh, c_fuchsia, 0);
			draw_vertex_color(global.vw, global.hvh, c_fuchsia, 0);
			draw_vertex_color(0, global.vh, c_fire, 1);
			draw_vertex_color(global.vw, global.vh, c_fire, 1);
		draw_primitive_end();
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
		
	surface_set_target(disortedSurf)
		gpu_set_tex_filter_ext(u_distort_tex, true);
		distortionShader_set(color_to_vec3(c_fire), 0.003);
	
		draw_surface_ext(surf, 0, 0, 1, 1, 0, c_white, 1);
	
		shader_reset();
		gpu_set_tex_filter(false);
		draw_sprite_tiled_ext(s_magmaCave_bg, 1, offset, 0, 1, 1, c_front, 1);	
	surface_reset_target();
	
	var _x = !ceiling.exiting ?
		clamp(ceiling.transitionX, global.vx, global.vr) : 
		min(global.vx, ceiling.transitionX - global.vw);
		
	shader_set(shd_maxAlpha);
		draw_surface_ext(disortedSurf, _x, global.water_y - global.vh, 1, 1, 0, c_white, 1);
	shader_reset();
} else {
	surf = surface_create(global.vw, global.vh);	
	disortedSurf = surface_create(global.vw, global.vh);	
}