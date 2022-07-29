//---- Celestial Bodies ----\\
switch(celestial_active) {
	case true:  if (celestial_fade<1) celestial_fade += .01; break;
	case false: if (celestial_fade>0) celestial_fade -= .01; break;
}


if (clock.time>ClockPoint.Nightfall-5 && clock.time<ClockPoint.Morning+5) {
	stars_alpha = fadeRange(clock.time,20,20,ClockPoint.Night,ClockPoint.Sunrise-12,0,1);
}

//---- Clouds ----\\
var cloud_motion = (.2 + (.8 * global.motion));
for (var i=0; i<cloud_num; i++) {
	var cloud = cloud_list[i];
	
	cloud.color = merge_color(c_sky_space, c_sky_clouds, cloud.merge_amount);
	
	var fCloud = cloud_list[cloud_fade_list[i]];
	if (cloud_fade_point <= i) {
		if (fCloud.alpha > 0) fCloud.alpha -= .01;	
	} else {
		if (fCloud.alpha < 1) fCloud.alpha += .01;	
	}
	
	cloud.x -= cloud.speed * cloud_motion;
	if (cloud.x < cloud_left) {
		cloud.x = cloud_right;
		cloud.image_index = irandom(sprite_get_number(spr_env_sky_clouds)-1);
		cloud.image_xscale = choose(-1,1)*cloud.size;
	}
}