/// @description Wind Create

alarm[0] = irandom_range(1*room_speed, 3*room_speed);

var xx = irandom_range(global.vx,global.vr);
var yy = global.water_y+random_range(-24,-64);
instance_create_layer(xx, yy, l_main, obj_env_wind);