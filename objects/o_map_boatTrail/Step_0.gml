color = c_water_highlight;

if (timer > 0) timer-- else {
	timer = interval;
	if (o_map_player.moveSpeed > .2) {
		var segment = new BoatTrailSegment();
		array_push(segmentList, segment);
	}
}

for (var i=0; i<array_length(segmentList); i++) {
	var s = segmentList[i];
	
	if (s.alpha > 0) s.alpha -= .01 else {
		array_delete(segmentList, 0, 1);
		surfaceOffset = (surfaceOffset + surfaceUnitLength) mod surfaceLength;
	}
	
	s.width += .05;
}

// Snap most recent trail to the bot position to prevent seam break
var listCount = array_length(segmentList);
if (listCount > 0) {
	var trailEnd = segmentList[listCount - 1];
	trailEnd.x = o_map_player.x;
	trailEnd.y = o_map_player.y;
	trailEnd.angle = -o_map_player.phy_rotation + 90;
}