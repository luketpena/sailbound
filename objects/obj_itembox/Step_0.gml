tilt = .5+lengthdir_y(.5,tilt_rot);
tilt_rot = (tilt_rot+4) mod 360;

floater_step();
behave_step_bouncer();

var distance_to_boat = point_distance(x,y,obj_boat_front.x_center_draw,obj_boat_front.y_center_draw);
if (distance_to_boat<32) {
	if (global.inventory_free) {
		item_pickup(item);
		instance_destroy();
	}	
}