segmentList = [];
interval = seconds(.1);
timer = 0;
unit = .05;
surfaceLength = 250;
surfaceUnitLength = surfaceLength * unit;
surfaceOffset = 0;
color = c_water_highlight;

function BoatTrailSegment() constructor {
	width = 4;
	angle = o_map_player.phy_rotation + 90;
	x = o_map_player.x;
	y = o_map_player.y;
	alpha = .5;
}

surf = noone;