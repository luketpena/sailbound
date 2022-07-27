if (timer > 0) timer-- else {
	timer = interval;
	if (obj_map_playerIcon.moveSpeed > .2) {
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
	trailEnd.x = obj_map_playerIcon.x;
	trailEnd.y = obj_map_playerIcon.y;
	trailEnd.angle = -obj_map_playerIcon.phy_rotation + 90;
}