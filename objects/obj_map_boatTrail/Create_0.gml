segmentList = [];
interval = .1 * room_speed;
timer = 0;
unit = .05;
surfaceLength = 250;
surfaceUnitLength = surfaceLength * unit;
surfaceOffset = 0;

function BoatTrailSegment() constructor {
	width = 4;
	angle = obj_map_playerIcon.phy_rotation + 90;
	x = obj_map_playerIcon.x;
	y = obj_map_playerIcon.y;
	alpha = .5;
}

surf = noone;