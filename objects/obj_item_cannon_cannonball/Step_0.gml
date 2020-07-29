var water_y = water_find_y_basic(x);
if (water_y<y) {
	waterBurst = true;
	event_user(0);
}

part_emitter_region(global.ps_fx_glow,pe_trail,x-r,x+r,y-r,y+r,ps_shape_ellipse,ps_distr_gaussian);

if (g_active) {
	physics_apply_force(x,y,0,15);	
} else {
	physics_apply_force(x,y,0,5);	
	var dis = point_distance(x,y,xstart,ystart);
	if (dis>g_range) g_active = true;
}