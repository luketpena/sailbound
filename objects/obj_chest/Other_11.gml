/// @description Burst


setCoinAmount();
behave_float_active = false;
flash = 1;
phy_speed_x *= .5;
part_particles_create(global.ps_fx_above,x,y,global.pt_burst_chest,16);
light = light_create(x,y,spr_fx_flare_300,0,1,1,c_gold,1,0,.025);