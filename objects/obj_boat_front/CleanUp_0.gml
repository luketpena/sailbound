part_emitter_destroy(global.ps_water_surface,pe_surface);
part_emitter_destroy(global.ps_fx_above,pe_front);
part_emitter_destroy(global.ps_fx_above,pe_water_line);

part_type_destroy(pt_water_jump_main);
part_type_destroy(pt_water_jump_point);

shadow_cleanup();