draw_set_alpha(1);
draw_set_color(c_white);
draw_text(32, 32, nextFinger);
if (debug) {
	for (var i=0; i<=maxFingers; i++) {
		draw_set_color(debugColor(i));
		var _finger = finger(i);
		var included = array_includes(swipeList, _finger.index);
				
		if (_finger.holding) {
			draw_circle(_finger.holdPos().x, _finger.holdPos().y, 48, true);
			
			for (var j=1; j<_finger.trackPoint_count; j++) {
				var point = _finger.trackPoints[j],
					prev  = _finger.trackPoints[j-1];
				draw_line(point.x, point.y, prev.x, prev.y);
			}
		}
		
		if (swipe && included) {
			draw_arrow(_finger.swipe_start.x, _finger.swipe_start.y, _finger.swipe_end.x, _finger.swipe_end.y, 64);
		}
	}
}
