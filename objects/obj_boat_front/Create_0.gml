fixture_create_circle(id,8,.5,.1,.1,.1,.2,false,false);
boat_init_stats();
boat_init_pieces();
boat_init_waterpoint();
boat_init_controls();
boat_init_animation();
boat_init_gameplay();
boat_init_movement();

pt_init_water_jump_main();
pt_init_water_jump_point();

pe_surface = part_emitter_create(global.ps_water_surface);
pe_front = part_emitter_create(global.ps_fx_above);
pe_water_line = part_emitter_create(global.ps_fx_above);

global.boat_x = x;
global.boat_y = y;