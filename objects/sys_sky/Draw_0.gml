//---- Setup ----\\
var time = clock.time;

//---- Backdrop ----\\
if (surface_exists(surf_sky)) {
	surface_set_target(surf_sky);
		draw_clear_alpha(c_black, 1);
		gpu_set_blendmode(bm_add);
		
			draw_sprite_ext(spr_env_sky_fade, 0, 0, global.vh, global.vw, 1, 0, c_white, .8);
			var flare_sunset = fadeRange(clock.time, 20, 40, clock.point.sunfall, clock.point.night, 0, .5);
			draw_sprite_ext(spr_fx_flare_300, 0, global.vw*.1, global.vh, 2, 1, 0, c_white, flare_sunset);			
			
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
	shader_set(shd_bwToColorGrad);
		shader_set_uniform_f_array(u_color1, c_sky_space_vec3);
		shader_set_uniform_f_array(u_color2, c_sky_horizon_vec3);
		draw_surface_ext(surf_sky, global.vx, sky_y, 1, 1, 0, c_white, 1);	
	shader_reset();
} else {
	surf_sky = surface_create(global.vw, global.vh);	
}

if (celestial_fade>0) {
	
	//>> Setup
	var sun_angle;
	var moon_angle;

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
	if (stars_alpha>0) {
		gpu_set_blendmode(bm_add);
			draw_sprite_tiled_ext(spr_env_sky_stars, 0, 0, 0, 1, 1, c_white, celestial_fade * stars_alpha);	
		gpu_set_blendmode(bm_normal);
	}

	//>> Drawing the sun
	if (sun_angle) {
		draw_sprite_ext(spr_env_sky_orbs, 0, 
			orb_x+lengthdir_x(orb_w, sun_angle), 
			orb_y+lengthdir_y(orb_h, sun_angle), 
			1, 1, 0, c_sun, celestial_fade);
	}

	//>> Drawing the moon
	if (moon_angle) {
		draw_sprite_ext(spr_env_sky_orbs, 1, 
			orb_x+lengthdir_x(orb_w, moon_angle), 
			orb_y+lengthdir_y(orb_h, moon_angle), 
			1, 1, 0, c_moon, celestial_fade);
	}
	
}


//---- Clouds ----\\
for (var i=0; i<cloud_num; i++) {
	var cloud = cloud_list[i];
	draw_sprite_ext(spr_env_sky_clouds, cloud.image, cloud.x, cloud.y, cloud.image_xscale, cloud.image_yscale, 0, cloud.color,  cloud.alpha);
	draw_sprite_ext(spr_env_sky_clouds, cloud.image+1, cloud.x, cloud.y, cloud.image_xscale, cloud.image_yscale, 0, c_sky_horizon,  cloud.highlight_alpha*cloud.alpha);
}