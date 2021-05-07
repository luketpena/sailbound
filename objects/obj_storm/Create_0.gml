y = global.water_y-256;

cloud_num = 6;

cloud_list = [];

surf_cloud = noone;

StormCloud = function(lerp_val, start_y) constructor {
	y = lerp(start_y+128, start_y, lerp_val);
	x = -irandom(1024 * lerp(.5, 1, lerp_val));
	scale = lerp(.5, 1, lerp_val);
	color = merge_color(c_dkgray, c_black, lerp_val);
	speed = lerp(.1, 1, lerp_val);
	length = 1024 * lerp(.5, 1, lerp_val);
}

for (var i=0; i<cloud_num; i++) {
	cloud_list[i] = new StormCloud(i/cloud_num, y);
}

storm_progress = 0;
transition = null; //palette_transition(scr_palette_storm, 0);

weather_set(Weather.rain);
