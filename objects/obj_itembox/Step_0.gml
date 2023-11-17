tilt = .5+lengthdir_y(.5, tilt_rot);
tilt_rot = (tilt_rot+4) mod 360;

floater_step(0);
behave_step_bouncer();

var distance_to_boat = point_distance(x, y, o_boat_main.x_center_draw, o_boat_main.y_center_draw);
if (distance_to_boat < 32) {
	if (itemInventory.hasFreeSlot) {
		item_pickup(item);
		instance_destroy();
	}	
}