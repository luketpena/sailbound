event_inherited();

var dis_player = point_distance(x, y, obj_boat_front.x_center_draw, obj_boat_front.y_center_draw);
if (dis_player<48) {
	var dir_player = point_direction(x, y, obj_boat_front.x_center_draw, obj_boat_front.y_center_draw);
	boat_impact(dir_player, 4);
	health_increment(-4);
	camera_set_shudder(24);
}