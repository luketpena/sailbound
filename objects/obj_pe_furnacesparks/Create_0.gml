//NewEffect Particle Types
//furnaceSparks
pt_furnaceSparks = part_type_create();
part_type_shape(pt_furnaceSparks, pt_shape_pixel);
part_type_size(pt_furnaceSparks, 1, 1, 0, 0);
part_type_scale(pt_furnaceSparks, 1, 1);
part_type_orientation(pt_furnaceSparks, 0, 0, 0, 0, 0);
part_type_color3(pt_furnaceSparks, 65535, 4235519, 255);
part_type_alpha3(pt_furnaceSparks, 0.10, 1, 0);
part_type_blend(pt_furnaceSparks, 1);
part_type_life(pt_furnaceSparks, 40, 250);
part_type_speed(pt_furnaceSparks, 0.10, 0.50, 0, 0);
part_type_direction(pt_furnaceSparks, 2, 84, 0, 10);
part_type_gravity(pt_furnaceSparks, 0.001, 270);

//NewEffect Emitters
pe_furnaceSparks = part_emitter_create(global.ps_fx_above);

//NewEffect emitter positions. Streaming or Bursting Particles.
var xp, yp;
xp = x;
yp = y;
part_emitter_region(global.ps_fx_above, pe_furnaceSparks, xp-14, xp+14, yp-7, yp+5, ps_shape_ellipse, ps_distr_linear);
part_emitter_stream(global.ps_fx_above, pe_furnaceSparks, pt_furnaceSparks, -15);

//Destroying Emitters
//part_emitter_destroy(global.ps, global.pe_furnaceSparks);