//---- Setup ----\\
var time = global.clock_time;

//---- Backdrop ----\\
draw_sprite_ext(spr_pixel,0,global.vx,global.vy,global.vw,global.vh,0,global.c_sky_space,1);
draw_sprite_ext(spr_env_sky_fade,0,global.vx,global.horizon_y,global.vw,1,0,global.c_sky_horizon,1);

if (celestial_fade>0) {
	
	//>> Setup
	var sun_angle;
	var moon_angle;

	//>> Setting the sun's position
	if (time>=clock_point_sunrise) {
		sun_angle = lerp(0,90,(time-clock_point_sunrise)/(360-clock_point_sunrise));
	} else if (time<clock_point_night) {
		sun_angle = lerp(90,180,time/clock_point_night);
	} else sun_angle = noone;

	//>> Setting the moon's position
	if (time>=clock_point_night && time<=clock_point_morning) {
		moon_angle = lerp(0,180,(time-clock_point_night)/(clock_point_morning-clock_point_night));	
	} else moon_angle = noone;

	//>> Drawing the stars
	if (stars_alpha>0) {
		gpu_set_blendmode(bm_add);
			draw_sprite_tiled_ext(spr_env_sky_stars,0,0,0,1,1,c_white,celestial_fade*stars_alpha);	
		gpu_set_blendmode(bm_normal);
	}

	//>> Drawing the sun
	if (sun_angle) {
		draw_sprite_ext(spr_env_sky_orbs,0,
			orb_x+lengthdir_x(orb_w,sun_angle),
			orb_y+lengthdir_y(orb_h,sun_angle),
			1,1,0,c_white,celestial_fade);
	}
	//>> Drawing the moon
	if (moon_angle) {
		draw_sprite_ext(spr_env_sky_orbs,1,
			orb_x+lengthdir_x(orb_w,moon_angle),
			orb_y+lengthdir_y(orb_h,moon_angle),
			1,1,0,c_white,celestial_fade);
	}
}

//---- Clouds ----\\
for (var i=0; i<cloud_num; i++) {
	var cloud = cloud_list[i];
	draw_sprite_ext(spr_env_sky_clouds,cloud.image_index,cloud.x,cloud.y,cloud.image_xscale,cloud.size,0,cloud.color,1);
}