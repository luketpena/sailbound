//---- Celestial Bodies ----\\
switch(celestial_active) {
	case true:  if (celestial_fade<1) celestial_fade += .01; break;
	case false: if (celestial_fade>0) celestial_fade -= .01; break;
}

if (global.clock_time>clock_point_nightfall-5 && global.clock_time<clock_point_morning+5) {
	stars_alpha = fadeRange(global.clock_time,20,20,clock_point_night,clock_point_sunrise,0,1);
}


//---- Clouds ----\\
var cloud_motion = (.2+.8*global.motion)
for (var i=0; i<cloud_num; i++) {
	var cloud = cloud_list[i];
	
	cloud.x -= cloud.speed*cloud_motion;
	if (cloud.x<cloud_left) {
		cloud.x = cloud_right;
		cloud.image_index = irandom(sprite_get_number(spr_env_sky_clouds)-1);
		cloud.image_xscale = choose(-1,1)*cloud.size;
	}
}