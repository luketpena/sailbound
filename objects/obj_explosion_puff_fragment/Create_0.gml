xspeed = random_range(-3, 3);
yspeed = random_range(-2, -4);

pt = part_type_create();
part_type_life(pt, 10, 30);
part_type_alpha3(pt, 1, .25, 0);
part_type_orientation(pt, 0, 360, 0, 0, 0);
part_type_color3(pt, c_orange, c_dkorange, c_black);
part_type_sprite(pt, spr_fx_particle_swirl, 0, 0, 0);
part_type_size(pt, .25, .5, 0, 0);	

pe = part_emitter_create(global.ps_fx_glow);
part_emitter_stream(global.ps_fx_glow, pe, pt, 1)

life_set = irandom_range(.4*room_speed, .8*room_speed)
life = life_set;

end_delay = 30;