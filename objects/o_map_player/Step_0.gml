var lv = input.map.sail_v.value;
var lh = input.map.sail_h.value;
if (lv != 0 || lh != 0) {
	axisH = lh;
	axisV = lv;
}

var gPdir = point_direction(0, 0, axisH, axisV);
var gPdis = min(point_distance(0, 0, lh, lv), 1);
var targetSpeed = 0;

targetAngle = gPdir - camera_get_view_angle(view_camera[0]);
targetSpeed = moveSpeedMax * gPdis;


// Altering rate of speed
if (moveSpeed < targetSpeed) {
	moveSpeed += (targetSpeed - moveSpeed) * moveRate;	
} else {
	moveSpeed *= moveRate;	
}

// Setting physics position based on input
phy_rotation += angle_difference(-targetAngle, phy_rotation) * rotateRate;
phy_position_x += lengthdir_x(moveSpeed, -phy_rotation);	
phy_position_y += lengthdir_y(moveSpeed, -phy_rotation);

// Part emitter position and particle color
var _pe_angle = phy_rotation + 90;
part_type_color1(part, c_water_highlight);
part_emitter_region(sys_map_particles.sys, pe,
	x + lengthdir_x(-pe_size, _pe_angle),
	x + lengthdir_x(pe_size, _pe_angle),
	y + lengthdir_y(-pe_size, _pe_angle),
	y + lengthdir_y(pe_size, _pe_angle),
	ps_shape_ellipse,
	ps_distr_gaussian
)

// Activating / deactivating the stream
if (moveSpeed > 1) {
	part_emitter_stream(sys_map_particles.sys, pe, part, -1);	
} else {
	part_emitter_stream(sys_map_particles.sys, pe, part, 0);	
}

// Activating levels
var _nearestLevel = instance_nearest(x, y, prnt_map_level);
if (instance_exists(_nearestLevel) &&
	point_distance(x, y, _nearestLevel.x, _nearestLevel.y) < _nearestLevel.range) {
	global.targetLevel = _nearestLevel;	
} else {
	global.targetLevel = noone;	
}