///@description Snaps the boat center to a specific position and moves front + back relatively
///@param x center x position
///@param y center y position
function boat_snapPosition(x, y) {
	var originalPosition = {
		x: obj_boat_front.x_center_draw,
		y: obj_boat_front.y_center_draw,
	}
	
	var diff = {
		x: x-originalPosition.x,
		y: y-originalPosition.y,
	}
	
	boat_setPosition_front(obj_boat_front.x + diff.x, obj_boat_front.y + diff.y);
	boat_setPosition_back(obj_boat_back.x + diff.x, obj_boat_back.y + diff.y);
}

///@description Snaps the boat center to a specific position relative to the current center
///@param xdis x distance to move boat
///@param ydis y distance to move boat
function boat_snapPosition_relative(xdis, ydis) {
	boat_setPosition_front(obj_boat_front.x + xdis, obj_boat_front.y + ydis);
	boat_setPosition_back(obj_boat_back.x + xdis, obj_boat_back.y + ydis);
}

function boat_snapPosition_toWater() {
	boat_snapPosition(
		obj_boat_front.x_center,
		obj_boat_front.waterY_center,
	);	
}

///@description Sets the phy position for the front of the boat
///@param x x position
///@param y y position
function boat_setPosition_front(x, y) {
	obj_boat_front.phy_position_x = x;
	obj_boat_front.phy_position_y = y;
}

///@description Sets the phy position for the back of the boat
///@param x x position
///@param y y position
function boat_setPosition_back(x, y) {
	obj_boat_back.phy_position_x = x;
	obj_boat_back.phy_position_y = y;
}