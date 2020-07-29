//---- Setup ----\\
clock_set_points();
alarm[0] = 15; //Setting cloud color
alarm[1] = 15; //Generating wind

//---- Sun, Moon, and Stars ----\\
orb_w = global.hvw-48;
orb_h = 100;
orb_x = room_width/2;
orb_y = global.horizon_y+30;
stars_alpha = 0;

celestial_active = true;
celestial_fade = 1;

//---- Clouds ----\\
cloud_num = 30;
cloud_left = -100;
cloud_right = room_width+100;
for (var i=0; i<cloud_num; i++) {
	var lerp_set = i/cloud_num;
	cloud_list[i] = {
		cLerp: lerp_set,
		x: random_range(cloud_left,cloud_right),
		y: lerp(global.horizon_y-32,global.horizon_y-64,lerp_set),
		color: merge_color(global.c_sky_horizon,global.c_sky_clouds,lerp_set),
		size: lerp(.2,1,lerp_set),
		speed: lerp(.01,.5,lerp_set),
		image_index: irandom(sprite_get_number(spr_env_sky_clouds)-1),
		image_xscale: choose(-1,1)*lerp_set
	}
	//cloud_lerp[i] = i/cloud_num;
	//cloud_x[i] = random_range(cloud_left,cloud_right);
	//cloud_y[i] = lerp(global.horizon_y-32,global.horizon_y-64,cloud_lerp[i]);
	//cloud_color[i] = merge_color(global.c_sky_horizon,global.c_sky_clouds,cloud_lerp[i]);
	//cloud_size[i] = lerp(.2,1,cloud_lerp[i]);
	//cloud_speed[i] = lerp(.01,.5,cloud_lerp[i]);
	//cloud_index[i] = irandom(sprite_get_number(spr_env_sky_clouds)-1);
	//cloud_xscale[i] = choose(-1,1)*cloud_size[i];
}


