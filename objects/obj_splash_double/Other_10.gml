/// @description Activate

image_speed = 1;

x1 = x-halfWidth;
x2 = x+halfWidth;

y1 = water_find_y_precise(x1);
y2 = water_find_y_precise(x2);

var dis = x2-x1;
var dir = point_direction(x1,y1,x2,y2); 
repeat(dis/2) {
	var length = random(dis);
	part_particles_create(
		global.ps_fx_above,
		x1+lengthdir_x(length,dir),
		y1+lengthdir_y(length,dir),
		global.pt_water_splash,1);
}