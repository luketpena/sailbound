// Inherit the parent event
event_inherited();

rot = (rot + 5 * global.motion) mod 360;
backWheelOffset.x = lengthdir_x(5, hull_angle + 90);
backWheelOffset.y = lengthdir_y(5, hull_angle + 90);