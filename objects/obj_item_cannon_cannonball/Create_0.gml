fixture_create_circle(id,4,.5,.5,0,0,0,true,true);

r = 4
pe_trail = part_emitter_create(global.ps_fx_glow);
part_emitter_region(global.ps_fx_glow,pe_trail,x-r,x+r,y-r,y+r,ps_shape_ellipse,ps_distr_gaussian)
part_emitter_stream(global.ps_fx_glow,pe_trail,global.pt_fire_trail,1);

g_active = false;
g_range = 96;

waterBurst = false; //triggers if impacting on waters