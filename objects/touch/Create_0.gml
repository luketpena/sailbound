/*
	Actions we look for on a finger
		- Click
		- Tap
		- Hold
		- Release
		- Swipe
		- Drag
*/

debug = true;
debug_colors = [c_purple, c_green, c_blue, c_yellow];

click = false;
click_index = -1;

release = false;
release_index = -1;

tap = false;
tap_index = -1;

trackPoint_count = 5;

swipe = false;
swipe_dir = 0;
swipe_dis = 0;
swipe_index = -1;
swipe_threshold = 25;
swipe_start = new Pos();
swipe_end = new Pos();
swipe_testCount = 0;

tap = false;
tap_index = -1;

hold_fingers = []; // An array of fingers that are currently holding
hold_index = -1; // The index of the newest finger to change
hold = false; // Whether a hold has begun in the last frame or not
holdTrackDis = 16;

function debugColor(index) {
	return debug_colors[index];	
}


maxFingers = 3; // How many fingers simultaneously, counting from 0
nextFinger = 0; // Which finger is the next to be activated (lowest one free)
fingerList = [];
swipeList = []; // Which fingers are currently swiping

tapTime = .1 * room_speed;
swipeDistance = 8; 


Finger = function(_index) constructor {
	function Pos() constructor {
		x = 0;
		y = 0;
	}
	
	index = _index;
	active = false; // Is the finger currently touching the screen
	pos = new Pos();
	endPos = new Pos();
	duration = 0; // How long the gesture lasted
	holding = false; // Whether or not the finger is holding
	holdPos = function() {
		return trackPoints[0];	
	}
	tap = false;

	swipe = false;
	swipe_dir = 0;
	swipe_dis = 0;
	swipe_start = new Pos();
	swipe_end = new Pos();
	swipe_testCount = 0;
	
	trackPoint_count = touch.trackPoint_count;
	trackPoints = array_create(trackPoint_count);
	for (var i=0; i<trackPoint_count; i++) {
		trackPoints[i] = new Pos();	
	}

	// Initializes all track points to starting position
	function track_start() {
		for (var i=0; i<trackPoint_count; i++) {
			point = trackPoints[i];
			point.x = device_mouse_x_to_gui(index);
			point.y = device_mouse_y_to_gui(index);
		}	
	}

	function track_step() {
		for (var i=trackPoint_count-1; i>=0; i--) {
			var point = trackPoints[i];
			if (i = 0) {
				point.x = device_mouse_x_to_gui(index);
				point.y = device_mouse_y_to_gui(index);
			} else {
				var prev = trackPoints[i-1];
				point.x = prev.x;
				point.y = prev.y;
			}
		}	
	}
	
	function track_length() {
		var length = 0;
		for (var i=1; i<trackPoint_count; i++) {
			var point = trackPoints[i],
				prev = trackPoints[i-1];
			length += point_distance(point.x, point.y, prev.x, prev.y);
		}
		return length;
	}
	
	function track_dir() {
		var first = trackPoints[0],
			last  = trackPoints[trackPoint_count-1];
		return point_direction(first.x, first.y, last.x, last.y);
	}
	
	function setSwipeDir() {
		var first = trackPoints[0],
			last  = trackPoints[trackPoint_count-1];
		swipe_dir = point_direction(last.x, last.y, first.x, first.y);
	}
}

for (var i=0; i<=maxFingers; i++) {
	fingerList[i] =  new Finger(i);
}

finger = function(index) {
	return fingerList[index];
}

function determineNextFinger() {
	for (var i=0; i<=maxFingers; i++) {
		var _finger = finger(i);
		if (!_finger.active) {
			return _finger.index;
		}
		return maxFingers;
	}
}

function zone_swipe_finger(targetZone, index) {
	var _finger = finger(index);
	if (!_finger.swipe) return false;
	
	for (var i=1; i<trackPoint_count; i++) {
		var p1 = _finger.trackPoints[i];
		var p2 = _finger.trackPoints[i-1];
		
		if (collision_line(p1.x, p1.y, p2.x, p2.y, targetZone, false, true)) {
			return true;	
		}
	}
	return false;
}

function zone_swipe(targetZone) {
	var swipeCount = array_length(swipeList);
	if (swipeCount = 0) return noone;
	
	for (var i=0; i<swipeCount; i++) {
		var _finger = swipeList[i];
		for (var j=1; j<trackPoint_count; j++) {
			var p1 = _finger.trackPoints[j];
			var p2 = _finger.trackPoints[j-1];
		
			if (collision_line(p1.x, p1.y, p2.x, p2.y, targetZone, false, true)) {
				return _finger.index;	
			}
		}
	}
	return noone;
}