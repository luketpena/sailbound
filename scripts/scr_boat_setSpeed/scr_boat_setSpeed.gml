// Sets the vspeed of the boat halves
function boat_set_vspeed(vspeed_front, vspeed_back) {
	o_boat_main.phy_speed_y = vspeed_front;
	obj_boat_back.phy_speed_y = vspeed_back;
	
	if (vspeed_front>0)
		then o_boat_main.impactLock = ImpactLock.Up
		else o_boat_main.impactLock = ImpactLock.Down;
}

function boat_accel_vspeed(targetSpeed, accelRate) {
	var sampleBoatSpeed = o_boat_main.phy_speed_y;
	with(o_boat_main) {
		if (targetSpeed > phy_speed_y) {
			phy_speed_y = min(targetSpeed, phy_speed_y + accelRate);
		} else if (targetSpeed < phy_speed_y) {
			phy_speed_y = max(targetSpeed, phy_speed_y - accelRate);
		}
	}
	obj_boat_back.phy_speed_y += (o_boat_main.phy_speed_y - sampleBoatSpeed);
}

// Sets the hspeed of the boat halves
function boat_set_hspeed(hspeed_front, hspeed_back) {
	o_boat_main.phy_speed_x = hspeed_front;
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
	var stopList = [o_boat_main, obj_boat_back, obj_boat_center];
	for (var i=0; i<array_length(stopList); i++) {
		var obj = stopList[i];
		obj.phy_speed_x = 0;
		obj.phy_speed_y = 0;
		obj.phy_angular_velocity = 0;
	}
}