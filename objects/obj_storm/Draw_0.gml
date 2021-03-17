if surface_exists(surf_cloud) {
	surface_set_target(surf_cloud)
	
		draw_clear_alpha(c_black, 0);
		
		
		
		for (var i=0; i<cloud_num; i++) {
			var cloud = cloud_list[i];
			var c = merge_color(global.c_sky_horizon, global.c_sky_space, i/cloud_num);
			draw_sprite_ext(spr_env_storm_clouds_loop, 0, cloud.x, cloud.y-global.vy, cloud.scale, cloud.scale, 0, c, 1);
			draw_sprite_ext(spr_env_storm_clouds_loop, 0, cloud.x+cloud.length, cloud.y-global.vy, cloud.scale, cloud.scale, 0, c, 1);
		}
			
		draw_sprite_ext(spr_pixel, 0, 0, 0, global.vw*2*(1-storm_progress), global.vh, 0, c_black, 1);
	surface_reset_target();
	
	shader_set(shd_subtract);
		draw_surface_ext(surf_cloud, global.vx, global.vy, 1, 1, 0, c_white, 1);
		
	shader_reset();
} else {
	surf_cloud = surface_create(global.vw, global.vh);	
}

draw_sprite_ext(spr_env_storm_clouds_back,   0, global.vr-(global.vw*2*storm_progress), global.horizon_y,1,1,0,global.c_sky_horizon,1);
draw_sprite_ext(spr_env_storm_clouds_mid,    0, global.vr+128-(global.vw*2.5*storm_progress), global.horizon_y,1,1,0,merge_color(global.c_sky_horizon, global.c_sky_clouds, .5),1);
draw_sprite_ext(spr_env_storm_clouds_front,  0, global.vr+256-(global.vw*3*storm_progress), global.horizon_y,1,1,0,global.c_sky_clouds,1);