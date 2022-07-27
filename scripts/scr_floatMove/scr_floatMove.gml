function floatMove_init(maxSpeed, accel) {
	floatMove = {
		xspeed: 0,
		yspeed: 0,
		maxSpeed: maxSpeed,
		accel: accel
	}
}

function floatMove_move_dir(dir) {
	var xlimit = lengthdir_x(floatMove.maxSpeed, dir);
	var ylimit = lengthdir_y(floatMove.maxSpeed, dir);
	
	var notTooFarRight = !(xlimit > 0 && floatMove.xspeed > xlimit);
	var notTooFarLeft = !(xlimit < 0 && floatMove.xspeed < xlimit);
	
	if (notTooFarRight && notTooFarLeft) {
		floatMove.xspeed += lengthdir_x(floatMove.accel, dir);
	}

	var notTooFarDown = !(ylimit > 0 && floatMove.yspeed > ylimit);
	var notTooFarUp = !(ylimit < 0 && floatMove.yspeed <ylimit);
	if (notTooFarDown && notTooFarUp) {
		floatMove.yspeed += lengthdir_y(floatMove.accel, dir);
	}		
}

function floatMove_move_point(_x, _y) {
	var dir = point_direction(x, y, _x, _y);
	floatMove_move_dir(dir);
}

function floatMove_move_object(object) {
	if (instance_exists(object)) {
		floatMove_move_point(object.x, object.y);	
	}
}

function floatMove_stop_ext(rateX, rateY) {
	floatMove.xspeed *= rateX;
	floatMove.yspeed *= rateY;
}

function floatMove_slow(rate) {
	floatMove_stop_ext(rate, rate);
}

function floatMove_stop() {
	floatMove_speed_set(0, 0);	
}

function floatMove_speed_set(xspeed, yspeed) {
	floatMove.xspeed = xspeed;
	floatMove.yspeed = yspeed;
}

function floatMove_speed_set_dir(dir, speed) {
	floatMove_speed_set(
		lengthdir_x(speed, dir),
		lengthdir_y(speed, dir)
	);
}

function floatMove_apply() {
	x += floatMove.xspeed;
	y += floatMove.yspeed;
}

function floatMove_apply_phy() {
	phy_position_x += floatMove.xspeed;
	phy_position_y += floatMove.yspeed;
}
