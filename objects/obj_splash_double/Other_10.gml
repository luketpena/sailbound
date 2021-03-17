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
	var xx = x1+lengthdir_x(length,dir)
	var yy = water_find_y_basic(xx);
	part_particles_create(
		global.ps_fx_above,
		xx,
		yy,
		global.pt_water_splash,1);
}