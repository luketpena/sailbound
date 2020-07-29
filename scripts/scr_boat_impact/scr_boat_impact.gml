///@description Creates an impact against the boat at an angle

function boat_impact(angle, strength) {



	var debris_angle = angle-angle_difference(angle,90)*.5;
	repeat(irandom_range(3,5)) create_debris(global.boat_x,global.boat_y,spr_fx_boat_debris,irandom(sprite_get_number(spr_fx_boat_debris)),1,3,debris_angle-20,debris_angle+20,200,500,1);

	part_particles_create(global.ps_fx_above,global.boat_x,global.boat_y,global.pt_explosion_burst,8);

	var move_x = lengthdir_x(strength,angle);
	var move_y = lengthdir_y(strength*.5,angle);

	obj_boat_front.phy_speed_x += move_x;
	obj_boat_front.phy_speed_y += move_y;

	obj_boat_back.phy_speed_x += move_x;
	obj_boat_back.phy_speed_y += move_y;

	obj_boat_draw.flash = 1;

	boat_peter_set_animation(spr_peter_hit,.5,true,.5*room_speed,0);
	
	global.boat_canDamage = false;
	with(obj_boat_draw) {
		dmgFlicker_alarm = 2*room_speed;
		dmgFlicker_flip_alarm = .1*room_speed;
		dmgFlicker_flip = true;
	}

}
