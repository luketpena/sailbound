//---- Setup ----\\
var time = global.clock_time;

//---- Backdrop ----\\
if (surface_exists(surf_sky)) {
	surface_set_target(surf_sky);
		draw_clear_alpha(c_black,1);
		gpu_set_blendmode(bm_add);
		
			draw_sprite_ext(spr_env_sky_fade,0,0,global.vh,global.vw,1,0,c_white,.8);
			var flare_sunset = fadeRange(global.clock_time,20,40,clock_point_sunfall,clock_point_night,0,.5);//fadeRange(global.clock_time,pSunset-10,pSunset+10,pSunset-5,pSunset+5,0,1);
			draw_sprite_ext(spr_fx_flare_300,0,global.vw*.1,global.vh,2,1,0,c_white,flare_sunset);			
			
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
	shader_set(shd_bwToColorGrad);
		shader_set_uniform_f_array(u_color1,global.c_sky_space_vec3);
		shader_set_uniform_f_array(u_color2,global.c_sky_horizon_vec3);
		draw_surface_ext(surf_sky,global.vx,sky_y,1,1,0,c_white,1);	
	shader_reset();
} else {
	surf_sky = surface_create(global.vw,global.vh);	
}

if (celestial_fade>0) {
	
	//>> Setup
	var sun_angle;
	var moon_angle;

	//>> Setting the sun's position
	
	if (time>=clock_point_sunrise) {
		sun_angle = lerp(0,90,(time-clock_point_sunrise)/(360-clock_point_sunrise));
	} else if (time<clock_point_nightfall) {
		sun_angle = lerp(90,180,time/clock_point_nightfall);
	} else sun_angle = noone;

	//>> Setting the moon's position
	var moonPoint = clock_point_morning-13;
	if (time>=clock_point_night && time<=moonPoint) {
		moon_angle = lerp(0,180,(time-clock_point_night)/(moonPoint-clock_point_night));	
	} else moon_angle = noone;

	//>> Drawing the stars
	if (stars_alpha>0) {
		gpu_set_blendmode(bm_add);
			draw_sprite_tiled_ext(spr_env_sky_stars,0,0,0,1,1,c_white,celestial_fade*stars_alpha);	
		gpu_set_blendmode(bm_normal);
	}

	//>> Drawing the sun
	if (sun_angle) {
		var c_sun = global.c_sun[1];
		
		if (global.clock_time>clock_point_sunrise && global.clock_time<clock_point_day) {
			var merge_amount = (global.clock_time-clock_point_sunrise)/(clock_point_day-clock_point_sunrise);
			c_sun = merge_color(global.c_sun[0],global.c_sun[1],merge_amount); 	
		}
		
		if (global.clock_time>clock_point_sunset && global.clock_time<clock_point_nightfall) {
			var merge_amount = 	(clock_point_nightfall-global.clock_time)/(clock_point_nightfall-clock_point_sunset);
			c_sun = merge_color(global.c_sun[2],global.c_sun[1],merge_amount); 
		}
	
		draw_sprite_ext(spr_env_sky_orbs,0,
			orb_x+lengthdir_x(orb_w,sun_angle),
			orb_y+lengthdir_y(orb_h,sun_angle),
			1,1,0,c_sun,celestial_fade);
	}

	//>> Drawing the moon
	if (moon_angle) {
		draw_sprite_ext(spr_env_sky_orbs,1,
			orb_x+lengthdir_x(orb_w,moon_angle),
			orb_y+lengthdir_y(orb_h,moon_angle),
			1,1,0,global.c_moon[0],celestial_fade);
	}
}


//---- Clouds ----\\
for (var i=0; i<cloud_num; i++) {
	var cloud = cloud_list[i];
	draw_sprite_ext(spr_env_sky_clouds,cloud.image,cloud.x,cloud.y,cloud.image_xscale,cloud.image_yscale,0,cloud.color, cloud.alpha);
	draw_sprite_ext(spr_env_sky_clouds,cloud.image+1,cloud.x,cloud.y,cloud.image_xscale,cloud.image_yscale,0,global.c_sky_horizon, cloud.highlight_alpha*cloud.alpha);
}