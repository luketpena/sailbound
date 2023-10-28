if (move_speed<move_speed_max) move_speed += .2;
target_x = global.vx+16;
target_y = global.vb-16;

var dir = point_direction(x,y,target_x,target_y);
var dis = point_distance(x,y,target_x,target_y);

if (dis < 16) {
	global.coin += 1;
	instance_destroy();
}

x += lengthdir_x(move_speed,dir);
y += lengthdir_y(move_speed,dir);