weather_fade = sys_weather.weather_fade;

if (weather_fade>0) {
	precip_x -= precip_speed_h;
	precip_y += precip_speed_v;
}