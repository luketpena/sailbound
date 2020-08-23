//---- Setup ----\\
clock_set_points();
alarm[0] = 15; //Generating wind

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

cloud_fade_list = [];
cloud_fade_point = 60; // How many clouds to show

for (var i=0; i<cloud_num; i++) {
	var lerp_set = i/cloud_num;
	cloud_list[i] = new Cloud(lerp_set, cloud_left, cloud_right);
	cloud_fade_list[i] = i;
}
cloud_fade_list = array_shuffle(cloud_fade_list);



