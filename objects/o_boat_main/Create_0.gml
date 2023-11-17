fixture_create_circle(id, 8, .5, .1, .1, .1, .2, false, false);
boat_init_stats();
boat_init_pieces();
boat_init_waterpoint();
boat_init_controls();
boat_init_animation();
boat_init_gameplay();
boat_init_movement();
boat_impactFreeze_init();
boat_physics_init();

pt_init_water_jump_main();
pt_init_water_jump_point();

shadow_init(boat_width, 128);

pe_surface = part_emitter_create(global.ps_water_surface);
pe_front = part_emitter_create(global.ps_fx_above);
pe_water_line = part_emitter_create(global.ps_fx_above);

global.boat_x = x;
global.boat_y = y;

instance_create_layer(mouse_x, mouse_y, l_main, o_light_mouse);