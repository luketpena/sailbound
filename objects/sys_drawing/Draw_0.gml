draw_object(sys_sky);
draw_object(sys_horizon);
draw_object(sys_islands);
draw_object(obj_location); 

draw_object(sys_water_back);

draw_object(obj_ground);

lighting_shader_draw();

	draw_tag("fx_below");
	draw_object(obj_boat_draw);
	draw_tag("fx_above");
	
	draw_tag("item");
	draw_object(obj_petra);
	
	draw_object(obj_chest);
	draw_tag("pickup");
	
	draw_tag("mob");
	draw_tag("mob_items");
	
shader_reset();

draw_object(sys_water_front);
draw_object(sys_weather);