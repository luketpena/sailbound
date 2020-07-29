/// @description Cloud Color

alarm[0] = 1;

for (var i=0; i<cloud_num; i++) {
	var cloud = cloud_list[i]
	cloud.color = merge_color(global.c_sky_horizon,global.c_sky_clouds,cloud.cLerp);	
}