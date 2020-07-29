function boat_heal(health) {
	boat_peter_set_animation(spr_peter_cheer,.25,false,-1,0);
	light_create(obj_boat_front.x_center_draw,obj_boat_front.y_center_draw,spr_fx_flare_300,0,1,1,c_hp,1,-1,0.02);
	obj_boat_draw.flash = .9;
	repeat(8) {
		var rot = random(360);
		var dis = random(32);
		part_particles_create(
			global.ps_fx_above,
			obj_boat_front.x_center_draw+lengthdir_x(dis,rot),
			obj_boat_front.y_center_draw+lengthdir_y(dis,rot),
			global.pt_hearts,1);
	}
	scr_health_increment(health)
}