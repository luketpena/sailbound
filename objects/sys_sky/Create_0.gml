//---- Setup ----\\
alarm[0] = 15; //Generating wind

//---- Sun, Moon, and Stars ----\\
orb_w = global.hvw - 48;
orb_h = 100;
stars_alpha = 0;

celestial_active = true;
celestial_fade = 1;

surf_sky = -1;
sky_y = global.horizon_y - global.vh;

sunAngle = 0;
moonAngle = 0;

u_color1 = shader_get_uniform(shd_bwToColorGrad,"color1");
u_color2 = shader_get_uniform(shd_bwToColorGrad,"color2");

//---- Clouds ----\\
cloud_num = (room_width / 640) * 60;
cloud_left = -100;
cloud_right = room_width + 100;

cloud_fade_list = [];
cloud_fade_point = cloud_num; // How many clouds to show
cloud_tracking = true; // Whether they track along with the camera, for town use

for (var i=0; i<cloud_num; i++) {
	var lerp_set = i / cloud_num;
	cloud_list[i] = new Cloud(lerp_set, cloud_left, cloud_right);
	cloud_fade_list[i] = i;
}
cloud_fade_list = array_shuffle(cloud_fade_list);

u_color1 = shader_get_uniform(shd_bwToColorGrad, "color1");
u_color2 = shader_get_uniform(shd_bwToColorGrad, "color2");

function init() {
	sky_y = global.horizon_y - global.vh;
	orb_y = global.horizon_y + 30;
	orb_h = 180;
	for (var i=0; i<cloud_num; i++) {
		var cloud = cloud_list[i];
		cloud.resetY_town();
	}
}