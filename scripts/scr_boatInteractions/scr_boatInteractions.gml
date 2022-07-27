function distanceFromBoat(x, y) {
	return point_distance(x, y, obj_boat_front.x_center_draw, obj_boat_front.y_center_draw);	
}

function directionToBoat(x, y) {
	return point_direction(x, y, obj_boat_front.x_center_draw, obj_boat_front.y_center_draw);	
}

function directionFromBoat(x, y) {
	return point_direction(obj_boat_front.x_center_draw, obj_boat_front.y_center_draw, x, y);	
}

function boat_bounce(bounceSpeed = -4) {
	boat_set_vspeed(bounceSpeed, bounceSpeed);
	boat_impactFreeze_trigger(.05, 5);
	vibrate_set_impulse(.5);
}


function boat_collide_basic(x, y){
	var collide_h = (x > obj_boat_back.x && x < obj_boat_front.x);
	var collide_dis = (point_distance(x, y, global.boat_x, global.boat_y) < obj_boat_front.boat_hwidth);
	
	return (collide_h && collide_dis);
}

function boat_collide_precise(x, y, radius) {
	return (collision_circle(x, y, radius, obj_boat_center, false, true) != noone);
}

///@description Creates an impact against the boat at an angle
///@param angle The direction to push
///@param strength The speed increment
///@param shove If shoving, we snap boat position, otherwise we increment
function boat_impact(angle, strength, shove = false) {
	var debris_angle = angle-angle_difference(angle, 90)*.5;
	repeat(irandom_range(3, 5)) create_debris(global.boat_x, global.boat_y, spr_fx_boat_debris, irandom(sprite_get_number(spr_fx_boat_debris)), 1, 3, debris_angle-20, debris_angle+20, 200, 500, 1);

	part_particles_create(global.ps_fx_above, global.boat_x, global.boat_y, global.pt_explosion_burst, 8);

	var move_x = lengthdir_x(strength, angle);
	var move_y = lengthdir_y(strength*.5, angle);

	if (shove) {
		obj_boat_front.phy_speed_x = move_x;
		obj_boat_front.phy_speed_y = move_y;

		obj_boat_back.phy_speed_x = move_x;
		obj_boat_back.phy_speed_y = move_y;
	} else {
		obj_boat_front.phy_speed_x += move_x;
		obj_boat_front.phy_speed_y += move_y;

		obj_boat_back.phy_speed_x += move_x;
		obj_boat_back.phy_speed_y += move_y;
	}

	obj_boat_draw.flash = 1;

	boat_peter_set_animation(spr_peter_hit, .5, true, .5*room_speed, 0);
	
	global.boat_canDamage = false;
	with(obj_boat_draw) {
		dmgFlicker_alarm = 3 * room_speed;
		dmgFlicker_flip_alarm = .1*room_speed;
		dmgFlicker_flip = true;
	}
}

function boat_damage(damage, angle, strength, vibrate, shove = 0) {
	health_increment(-damage);
	boat_impact(angle, strength, shove);
	vibrate_set_impulse(vibrate);	
}

function motion_stop() {
	instance_create_layer(0, 0, l_main, obj_anchor);	
}

function motion_start() {
	global.stop = false;
}