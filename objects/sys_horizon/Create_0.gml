/*
	Draws the background water up to the horizon line.
	Is dependant on the sys_water object.
*/

horizon_surface = noone;
horizon_texture = noone;

horizon_height = 24;

horizon_twinkle_pos = 0;
horizon_twinkle_rot = 0;
horizon_twinkle_alpha = 0;

global.horizon_y = global.water_y-global.water_center_y-horizon_height;

x1 = global.vx;
y1 = global.horizon_y;
x2 = global.vr;
y2 = global.water_y-global.water_center_y;

//-- DEPENDANT OBJECTS --\\
instance_create_layer(0,0,l_system,sys_sky);