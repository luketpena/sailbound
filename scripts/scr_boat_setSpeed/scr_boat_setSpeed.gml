// Sets the vspeed of the boat halves
function boat_set_vspeed(vspeed_front, vspeed_back) {
	obj_boat_front.phy_speed_y = vspeed_front;
	obj_boat_back.phy_speed_y = vspeed_back;
	
	if (vspeed_front>0)
		then obj_boat_front.impactLock = ImpactLock.Up
		else obj_boat_front.impactLock = ImpactLock.Down;
}

// Sets the hspeed of the boat halves
function boat_set_hspeed(hspeed_front, hspeed_back) {
	obj_boat_front.phy_speed_x = hspeed_front;
	obj_boat_back.phy_speed_x = hspeed_back;
}

// Sets the directional speed of the boat halves
function boat_set_speed(speed, direction) {
	var _vspeed = lengthdir_y(speed, direction),
		_hspeed = lengthdir_x(speed, direction);
		
	boat_set_vspeed(_vspeed, _vspeed);
	boat_set_hspeed(_hspeed, _hspeed);
}

function boat_stopMotion() {
	var stopList = [obj_boat_front, obj_boat_back, obj_boat_center];
	for (var i=0; i<array_length(stopList); i++) {
		var obj = stopList[i];
		obj.phy_speed_x = 0;
		obj.phy_speed_y = 0;
		obj.phy_angular_velocity = 0;
	}
}