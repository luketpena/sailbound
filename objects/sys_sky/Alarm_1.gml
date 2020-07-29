/// @description Wind Create

alarm[1] = irandom_range(1*room_speed,3*room_speed);

instance_create_layer(irandom_range(global.vx,global.vr),global.water_y+random_range(-24,-64),l_main,obj_env_wind);