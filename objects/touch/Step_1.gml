// Sense new fingers
swipeList = [];
if (nextFinger < maxFingers) {
	for (var i=0; i<=maxFingers; i++) {
		var _finger = finger(i),
			xx = device_mouse_x_to_gui(i),
			yy = device_mouse_y_to_gui(i);
		
		if (!_finger.active) {
			// Clicking / gesture start
			if (device_mouse_check_button_pressed(i, mb_left)) {
				click_index = i;
				click = true;
			
				_finger.pos = {
					x: xx,
					y: yy,
				}
			
				_finger.active = true;
				determineNextFinger()
			}
		} else {
			// Releasing / gesture end
			if (device_mouse_check_button_released(i, mb_left)) {
				release_index = i;
				release = true;
			
				_finger.active = false;
				_finger.endPos = {
					x: xx,
					y: yy,
				}
				
				if (_finger.holding) {
					_finger.holding = false;
					var holdIndex = array_find(hold_fingers, i);
					hold_fingers = array_extract(hold_fingers, holdIndex).array;
				}
				
				if (_finger.duration <= tapTime) {
					tap_index = i;
					tap = true;
				}
				_finger.duration = 0;
			} else {
				_finger.duration++;
				
				if (!_finger.holding) {
					var disFromStart = point_distance(xx, yy, _finger.pos.x, _finger.pos.y);
					if (_finger.duration > tapTime || disFromStart > 16) {
						_finger.holding = true;
						_finger.track_start();
					}
				} else {
					_finger.track_step();	
					var dis = _finger.track_length();
					if (dis > swipe_threshold) {
						// Handles local swipe
						_finger.setSwipeDir();
						_finger.swipe = true;
						_finger.swipe_dis = dis;
						_finger.swipe_start.x = _finger.trackPoints[trackPoint_count-1].x;
						_finger.swipe_start.y = _finger.trackPoints[trackPoint_count-1].y;
						_finger.swipe_end.x = _finger.trackPoints[0].x;
						_finger.swipe_end.y = _finger.trackPoints[0].y;
						
						// Handles global sensing of a swipe
						array_push(swipeList, _finger);
						swipe = true;
					}
				}				
			}
		}
	}
}