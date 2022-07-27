var lv = gamepad_axis_value(0, gp_axislv);
var lh = gamepad_axis_value(0, gp_axislh);

var gPdir = point_direction(0, 0, lh, lv);
var gPdis = point_distance(0, 0, lh, lv);

var targetSpeed = 0;

if (gPdis > .3) {
	targetAngle = gPdir - camera_get_view_angle(view_camera[0]);
	
	
	var targetSpeed = 2 * gPdis;

}

if (moveSpeed < targetSpeed) {
	moveSpeed += (targetSpeed - moveSpeed) * .95;	
} else {
	moveSpeed *= .95;	
}

phy_rotation += angle_difference(-targetAngle, phy_rotation) * .1;
phy_position_x += lengthdir_x(moveSpeed, -phy_rotation);	
phy_position_y += lengthdir_y(moveSpeed, -phy_rotation);

if (part_system_exists(sys_map_particles.sys)) {
	if (part_emitter_exists(sys_map_particles.sys, pe)) {
		var size = 6;
		part_emitter_region(sys_map_particles.sys, pe,
			x + lengthdir_x(-size, phy_rotation+90),
			x + lengthdir_x(size, phy_rotation+90),
			y + lengthdir_y(-size, phy_rotation+90),
			y + lengthdir_y(size, phy_rotation+90),
			ps_distr_gaussian,
			ps_shape_ellipse,
		)
		if (moveSpeed > 1) {
			part_emitter_stream(sys_map_particles.sys, pe, part, -1);	
		} else {
			part_emitter_stream(sys_map_particles.sys, pe, part, 0);	
		}
	} else {
		pe = part_emitter_create(sys_map_particles.sys);
		part_emitter_stream(sys_map_particles.sys, pe, part, -2);
	}
}
