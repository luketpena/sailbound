if (surface_exists(surf_glow) && surface_exists(surf_effects) && surface_exists(surf_particles)) {
	draw_surface_ext(surf_effects,global.vx,global.vy,1,1,0,c_white,1);
	draw_surface_ext(surf_particles,0,0,1,1,0,c_white,1);
	gpu_set_blendmode_ext(bm_dest_alpha,bm_src_alpha);	
		draw_surface_ext(surf_glow,global.vx,global.vy,1,1,0,c_white,1);
	gpu_set_blendmode(bm_normal);	
}