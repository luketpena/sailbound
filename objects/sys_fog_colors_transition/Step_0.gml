if (active) {
	if (value<1) value += transition_speed else instance_destroy();
	
	sys_weather.fog_palette[0] = merge_color(old_fog_palette[0],fog_palette[0],value);
	sys_weather.fog_palette[1] = merge_color(old_fog_palette[1],fog_palette[1],value);
	sys_weather.fog_palette[2] = merge_color(old_fog_palette[2],fog_palette[2],value);
	sys_weather.fog_palette[3] = merge_color(old_fog_palette[3],fog_palette[3],value);
	sys_weather.fog_palette[4] = merge_color(old_fog_palette[4],fog_palette[4],value);
		
}