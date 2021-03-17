//---- Controls ----\\
alarm[0] = 15;

//---- Systems ----\\
global.ps_fx_above = part_system_create_layer(l_main,false);
global.ps_fx_glow = part_system_create_layer(l_main,false);
global.ps_water_surface = part_system_create();
global.ps_water_front = part_system_create();

global.ps_list = [
	global.ps_fx_above,
	global.ps_fx_glow,
	global.ps_water_surface,
	global.ps_water_front,
];

part_system_automatic_draw(global.ps_water_surface,false);
part_system_automatic_draw(global.ps_water_front,false);
part_system_automatic_draw(global.ps_fx_glow,false);

//---- Water Particles ----\\
pt_init_water_splash();
pt_init_water_wake_surface();
pt_init_water_wake_splash();
pt_init_water_bubble();

//---- Fire and Explosions ----\\
pt_init_explosion_burst();
pt_init_explosion_fragment();
pt_init_fire_trail();
pt_make_spark();

//---- Bursts ----\\
pt_init_burst_ko();
pt_init_burst_chest();

//---- Indicators ----\\
pt_init_hearts();