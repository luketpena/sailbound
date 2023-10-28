//---- Setup ----\\
var time = clock.time;

//---- Backdrop ----\\
if (surface_exists(surf_sky)) {
	
	// Drawing gradiant and details in BW to surface
	surface_set_target(surf_sky);
		draw_clear_alpha(c_black, 1);
		gpu_set_blendmode(bm_add);
		
			draw_sprite_ext(spr_env_sky_fade, 0, 0, global.vh, global.vw, 1, 0, c_white, .8);
			var flare_sunset = fadeRange(clock.time, .05, .05, clock.point.sunfall, clock.point.night, 0, .5);
			draw_sprite_ext(spr_fx_flare_300, 0, global.vw*.1, global.vh, 2, 1, 0, c_white, flare_sunset);			
			
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
	
	// Drawing BW surface reinterpretted into color through shader
	shader_set(shd_bwToColorGrad);
		shader_set_uniform_f_array(u_color1, c_sky_space_vec3);
		shader_set_uniform_f_array(u_color2, c_sky_horizon_vec3);
		draw_surface_ext(surf_sky, global.vx, sky_y, 1, 1, 0, c_white, 1);	
	shader_reset();
} else {
	surf_sky = surface_create(global.vw, global.vh);	
}

if (celestial_fade > 0) {
	
	//>> Setting the sun's position
	var sunriseDistance = (1 - clock.point.sunrise);
	var totalSunTravelDistance = sunriseDistance + clock.point.nightfall;
	var sunriseAngle = 180 * (sunriseDistance / totalSunTravelDistance);
	
	if (time >= clock.point.sunrise) {
		sun_angle = lerp(0, sunriseAngle, 1 - ((1 - time) / sunriseDistance));
	} else if (time<clock.point.nightfall) {
		sun_angle = lerp(sunriseAngle, 180, time / clock.point.nightfall);
	} else sun_angle = noone;

	//>> Setting the moon's position
	var moonFadePoint = clock.point.sunrise + .001;
	if (time >= clock.point.night || time <= moonFadePoint) {
		moon_angle = lerp(0, 180, (time - clock.point.night) / (moonFadePoint - clock.point.night));	
	} else moon_angle = noone;

	//>> Drawing the stars
	if (stars_alpha > 0) {
		gpu_set_blendmode(bm_add);
			draw_sprite_tiled_ext(spr_env_sky_stars, 0, global.vx, global.horizon_y, 1, 1, c_white, celestial_fade * stars_alpha);	
		gpu_set_blendmode(bm_normal);
	}

	//>> Drawing the sun
	var orbY = global.horizon_y + 30;
	
	if (sun_angle) {
		draw_sprite_ext(spr_env_sky_orbs, 0, 
			global.midx + lengthdir_x(orb_w, sun_angle), 
			orbY + lengthdir_y(orb_h, sun_angle), 
			1, 1, 0, c_sun, celestial_fade);
	}

	//>> Drawing the moon
	if (moon_angle) {
		draw_sprite_ext(spr_env_sky_orbs, 1, 
			global.midx + lengthdir_x(orb_w, moon_angle), 
			orbY + lengthdir_y(orb_h, moon_angle), 
			1, 1, 0, c_moon, celestial_fade);
	}
	
}


//---- Clouds ----\\

for (var i=0; i<cloud_num; i++) {
	var cloud = cloud_list[i];
	var cloudOffset = cloud_tracking
		? lerp((global.vx * .9), (global.vx * .7), cloud.lerpVal)
		: 0;
	var cloudX = cloud.x + cloudOffset;
	var cloudInView = (cloudX + 90 > global.vx && cloudX - 90 < global.vr);
	
	if (cloudInView) {
		draw_sprite_ext(spr_env_sky_clouds, cloud.image, cloudX, cloud.y, cloud.image_xscale, cloud.image_yscale, 0, cloud.color,  cloud.alpha);
		draw_sprite_ext(spr_env_sky_clouds, cloud.image + 1, cloudX, cloud.y, cloud.image_xscale, cloud.image_yscale, 0, c_sky_horizon,  cloud.highlight_alpha*cloud.alpha);
	}
}