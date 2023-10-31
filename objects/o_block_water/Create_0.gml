#region constructors
	///@function Creates a point along the line of vertices at the top of the water
	///@param {real} _x
	///@param {real} _index
	function WaterPoint(
		_x, _index
	) constructor {
		x = _x;
		y = 0;
		index = _index;
	}

	///@function One of many overlapping waves that influence the y offset of WaterPoints
	///@param {real} _angleOffset
	///@param {real} _rate
	///@param {real} _len
	///@param {real} _index
	function WaterWave(
		_angleOffset,
		_rate,
		_len,
		_index
	) constructor {
		angle = random(360);
		angleOffset = _angleOffset;
		rate = _rate;
		len = _len;
		index = _index;
		// How many rotations of the angle fit in a full loop?
		divCount = (360 / angleOffset);
		
		// Calculates the offset for a given index
		setOffset = function(index) {
			var angleOffsetCalculated = (angleOffset * index);
			return lengthdir_y(len, angle + angleOffsetCalculated);	
		}
		// Gets you the saved rotation for this current wave at a given looping index
		getOffset = function(i) {
			var result = array_get(
				array_get(o_block_water.waveOffset, index),
				i mod divCount
			);
			return result;
		}
	}
#endregion

//-- Controls
unitWidth = 6;

//-- Variables
global.water_y = y;
active = false;
front = instance_create_layer(x, y, "l_water", o_block_water_front);
front.init(id);
pointCount = (sprite_width / unitWidth) + 1;
points = array_create(pointCount);
bottomY = y + sprite_height;
waves = [
	new WaterWave(60, -1, .5, 0),
	new WaterWave(8, -3, 1, 1),
	new WaterWave(30, -8, 1, 2),
]
waveCount = array_length(waves);
// Offset for each mod unit of a wave is stored per wave
// waveOffset[waveIndex][stepIndex]
waveOffset = [];
for (var i=0; i<waveCount; i++) {
	var wave = waves[i];
	waveOffset[i] =	[];
	var cc = wave.divCount;
	 {
		for (var j=0; j<wave.divCount; j++) {
			var offset = wave.setOffset(j);
			array_push(waveOffset[i], offset);
		}
	}
}

minMax = {
	iMin: 0,
	iMax: 0,
}

//-- Functions

function setMinMax() {
	minMax.iMin = floor((global.vx - x) / unitWidth);
	minMax.iMax = ceil((global.vr - x) / unitWidth) + 1;
}

function drawCutout() {
	draw_primitive_begin(pr_trianglestrip);
		for (var i=minMax.iMin; i<minMax.iMax; i++) {
			var point = points[i];
			var xx = point.x - global.vx;
			draw_vertex_color(xx, point.y - global.vy, c_black, 1);
			draw_vertex_color(xx, bottomY - global.vy, c_black, 1);
		}
	draw_primitive_end();
}

function drawSurfaceLine() {
	for (var i=minMax.iMin; i<minMax.iMax; i++) {
		var point = points[i];
		var pointPrev = points[i-1];
		draw_set_alpha(1);
		draw_line_color(point.x, point.y - 1, pointPrev.x, pointPrev.y - 1, c_water_highlight, c_water_highlight);
	}
}

function getPositionY(_x) {
	// How far along the length of me is the x position, clamped at the start and end
	var _posXPercent = clamp((_x - x) / sprite_width, 0, 1);
	var _index = floor(_posXPercent * pointCount);
	return points[_index].y;
}


//-- Setup

// Populate the points array
for (var i=0; i<pointCount; i++) {
	var xPos = x + (unitWidth * i);
	var newPoint = new WaterPoint(xPos, i);
	points[i] = newPoint;
}
