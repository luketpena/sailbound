xspeed_lock = false;

var mySpeed = 4;
var myAngle = other.image_angle;

if (coyote_time>0) mySpeed = 8;

phy_speed_x = lengthdir_x(mySpeed,myAngle);
phy_speed_y = lengthdir_y(mySpeed,myAngle);
