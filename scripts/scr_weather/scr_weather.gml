enum Weather {
	rain,
	snow
}


function weather_set(type) {

	switch(type) {
		case Weather.rain:
			with(sys_weather) {
				weather_type = "rain";
				precip_sprite = spr_env_weather_rain;
				precip_speed_h = 3;
				precip_speed_v = 3;
				weather_active = true;
			}
			with(sys_weather_back) {
				precip_sprite = spr_env_weather_rain;
				precip_speed_h = 2;
				precip_speed_v = 2;
			}
			break;
		
		case Weather.snow:
			with(sys_weather) {
				weather_type = "snow";
				precip_sprite = spr_env_weather_snow;
				precip_speed_h = .75;
				precip_speed_v = .5;
				weather_active = true;
			}
			with(sys_weather_back) {
				precip_sprite = spr_env_weather_snow;
				precip_speed_h = .5;
				precip_speed_v = .25;
			}
			break;
	}



}
