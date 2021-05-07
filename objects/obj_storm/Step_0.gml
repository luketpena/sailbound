storm_progress = (mouse_x - global.vx) / global.vw;

sys_sky.cloud_fade_point = sys_sky.cloud_num * (1-storm_progress);
sys_weather.intensity = max(storm_progress-.5) * 2;

//transition.transition_point = storm_progress*.99;

for (var i=0; i<cloud_num; i++) {
	var cloud = cloud_list[i];
	
	cloud.x -= cloud.speed;
	if (cloud.x < -cloud.length) cloud.x += cloud.length;
}