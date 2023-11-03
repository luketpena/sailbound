offset += move.speed;
texture.position -= move.speed;

// Prop movement
for (var i=0; i<props.row.count; i++) {
	for (var j=0; j<array_length(props.row.data[i]); j++) {
		var prop = props.row.data[i][j];
		// X position is linear, but drawn stretched for perspective
		prop.x += move.speed;
		prop.drawX = findX(prop.x, prop.depth);
		// Remove props once they reach the end of the drawing space
		if (prop.x <= -margin) {
			var result = array_extract(props.row.data[i], j);	
			props.row.data[i] = result.array;
		}
	}
}

// Increment and wrap the texture offset
texture.offset += move.speed;
if (texture.offset < 0) texture.offset += 128;

if (offset < 0) {
	offset += unit.width;
	// The next vertical position in the line
	var yy = generateNextPoint();
	array_push(points, yy);	
	var copy = [];
	array_copy(copy, 0, points, 1, unit.count - 1);
	array_push(copy, yy);
	array_copy(points, 0, copy, 0, unit.count);
	
	var point1 = points[unit.count-1];
	var point2 = points[unit.count-4];
	elevation.steepness = abs(point1 - point2);
	createBlock(unit.count-2);
	
	currentDepth = findPointDepth(unit.count-1);
}

// Generate top and low x coordinates based on perspective
for (var i=0; i<unit.count; i++) {
	setMidXPosition(i);
	var perspective = get_perspective(xMid[i]);
	xTop[i] = xMid[i] - perspective;
	xLow[i] = xMid[i] + perspective;
}

// Elevation
elevation.rotStrength = (elevation.rotStrength + elevation.rotStrengthRate) mod 360;

if (elevation.change.active) {
	elevation.change.position = lerp(elevation.change.origin, elevation.change.target, elevation.change.lerpPos);
	if (elevation.change.progress >= 1) {
		elevation.change.active = false;	
	} else {
		elevation.change.progress += elevation.change.rate;
		elevation.change.lerpPos = animcurve_channel_evaluate(elevation.change.channel, elevation.change.progress);
	}
}

// Destroy when marked and beyond the room height
if (destroyAtEdge && points[0] > room_height) {
	instance_destroy();
}


if (keyboard_check_pressed(vk_space)) {
	var heightChoice = minY + 16 * irandom(4);
	changeHeight(heightChoice, 2);
}