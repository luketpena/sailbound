//---- Setup ----\\
clock_set_points();
alarm[1] = 15; //Generating wind

//---- Sun, Moon, and Stars ----\\
orb_w = global.hvw-48;
orb_h = 100;
orb_x = room_width/2;
orb_y = global.horizon_y+30;
stars_alpha = 0;

celestial_active = true;
celestial_fade = 1;

surf_sky = -1;
sky_y = global.horizon_y-global.vh;

u_color1 = shader_get_uniform(shd_bwToColorGrad,"color1");
u_color2 = shader_get_uniform(shd_bwToColorGrad,"color2");

//---- Clouds ----\\
cloud_num = 60;
cloud_left = -100;
cloud_right = room_width+100;
for (var i=0; i<cloud_num; i++) {
	var lerp_set = i/cloud_num;
	cloud_list[i] = {
		cLerp: lerp_set,
		x: random_range(cloud_left,cloud_right),
		y: lerp(global.horizon_y-32,global.horizon_y-128,lerp_set),
		color: merge_color(global.c_sky_horizon,global.c_sky_clouds,lerp_set),
		size: lerp(.2,1,lerp_set),
		speed: lerp(.01,.2,lerp_set),
		image_index: irandom(sprite_get_number(spr_env_sky_clouds)-1),
		image_xscale: lerp(.3,1,lerp_set)*choose(-1,1),
		image_yscale: lerp(.3,1,lerp_set),
		highlight_alpha: lerp(1,.1,lerp_set)
	}
}


