function boat_step_particles() {
	if (touched && !submerged) {
		part_emitter_region(global.ps_water_surface,pe_surface,back.x,x,global.water_center_y-2,global.water_center_y+2,ps_shape_ellipse,ps_distr_gaussian);
		part_emitter_stream(global.ps_water_surface,pe_surface,global.pt_water_wake_surface,1);
	
		part_emitter_region(global.ps_fx_above,pe_front,x-10,x+4,waterY_front-3,waterY_front+4,ps_shape_ellipse,ps_distr_gaussian);
	
		if (phy_speed_x>-1 && global.motion>.5)
			then part_emitter_stream(global.ps_fx_above,pe_front,global.pt_water_wake_splash,1)
			else part_emitter_stream(global.ps_fx_above,pe_front,global.pt_water_wake_splash,0);
	} else {
		part_emitter_stream(global.ps_water_surface,pe_surface,global.pt_water_wake_surface,0);
		part_emitter_stream(global.ps_fx_above,pe_front,global.pt_water_wake_splash,0);
	}


}
