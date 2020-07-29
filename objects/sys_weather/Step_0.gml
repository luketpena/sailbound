//---- Weather Stages ----\\
switch(weather_stage) {
	case "idle":
		if (weather_active) weather_stage = "fade in";
		break;
		
	case "fade in":
		if (weather_fade<1) weather_fade += weather_fade_rate else weather_stage = "sustain";
		break;
		
	case "sustain":
		if (!weather_active) weather_stage = "fade out";
		break;
		
	case "fade out":
		if (weather_fade>0) weather_fade -= weather_fade_rate else weather_stage = "idle";
		break;
}

//---- Precipitation ----\\
if (weather_fade>0) {
	precip_x -= precip_speed_h;
	precip_y += precip_speed_v;
}

//---- Fog ----\\
if (fog_active) {
	if (fog_fade<1) fog_fade += .001;	
} else {
	if (fog_fade>0) fog_fade -= .01;
}
if (fog_fade>0) {
	fog_color = scr_system_colors_blend(global.clock_time,fog_palette[0],fog_palette[1],fog_palette[2],fog_palette[3],fog_palette[4]);
	fog_color_array = color_to_vec3(fog_color);
	fog_position -= fog_speed;
}