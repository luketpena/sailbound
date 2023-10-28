draw_object(sys_sky);
draw_object(sys_horizon);
draw_object(obj_storm);
draw_object(islands);
draw_object(obj_location); 


draw_object(sys_water_backdrop);
with(ground) event_perform(ev_draw, ev_draw_begin);
draw_object(ground);

draw_object(sys_water_back);

draw_tag("fx_bottom");

lighting_shader_draw();
	
	draw_tag("solid_below");
	draw_tag("fx_below");
	draw_object(prnt_boat_draw);
	draw_tag("fx_above");
	
	draw_tag("item");
	draw_tag("fx_splash");
	draw_object(obj_petra);
		
	draw_object(obj_chest);
	draw_tag("pickup");
	
	draw_tag("mob");
	draw_tag("mob_items");
	
	draw_tag("amb_front");
	draw_tag("ring");	
shader_reset();

draw_tag("fx_over");
draw_object(ground_front);
draw_object(sys_water_distortion);
draw_tag("fx_top");

with(sys_glow) event_perform(ev_draw, ev_gui);
draw_object(sys_glow);

draw_object(sys_water_front);
draw_object(sys_weather);
draw_tag("gui");