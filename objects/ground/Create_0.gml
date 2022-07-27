///@description Setup

// Surfaces
margin = 128; // How far it stretches beyond the room width
surf = null;
surf_detail = null;
surf_transfer = null;
surfaceWidth = room_width + (margin * 2);
groundSprite = spr_sand;

// Divisions of the surface
unit = {
	width: 32,
	count: ceil(surfaceWidth / 32),
	midCount: 0,
}
unit.midCount = floor((unit.count - 1) / 2);

// Texture
tex = null;
texture = {
	unitWidth: unit.width / surfaceWidth,
	xtex: [0],
	offset: 0,
	position: 0,
}

// Positions
points = [y]; // The y positions
xTop = [0]; // x positions on the top, stretched for perspective
xLow = [0]; // x positions on the bottom, stretched for perspective
xMid = [0]; // x positions in center, no perspective
currentDepth = 0;

// Configures the chance of stone texture on the surface floor
stoneConfig = {
	sprite: spr_ground_debris_coral_stone_large,
	chance: 35, // How many sides to the dice	
	curve: animcurve_get_channel(cr_ground, "stone"),
}

// Movement
destroyAtEdge = false;
move = {
	speed: -1,
}
offset = unit.width;
minY = global.water_y + 32;


// The rotations that wiggle the ground's vertical position
elevation = {
	rot: [irandom(360), irandom(360), irandom(360)],
	rotRate: [5, 4, 25],
	dis: [10, 3, 5],
	rotStrength: irandom(360),
	rotStrengthRate: .25,
	steepness: 0,
	change: {
		active: false,
		channel: animcurve_get_channel(cr_ground, "changeHeight"),
		offset: 0,
		target: y,
		position: y,
		rate: 0,
		lerpPos: 0,
		progress: 0,
	}
};

// Fade color shader settings
u_color = shader_get_uniform(shd_fadeColor, "color");
u_pwr = shader_get_uniform(shd_fadeColor, "pwr");

// Props
props = {
	endX: 0, // left
	startX: room_width + ground.margin - 32, // right
	list: [],
	row: {
		count: 10,
		fade: [],
		data: [],
	}
}


// Populate the row settings
var curve = animcurve_get_channel(cr_ground, "fade");
for (var i = 0; i < props.row.count; i++) {
	props.row.fade[i] = 1 - animcurve_channel_evaluate(curve, i / (props.row.count - 1));
	props.row.data[i] = [];	
}


#region Functions

function updatePropChance(name, chance) {
	for (var i=0; i<array_length(props.list); i++) {
		var prop = props.list[i];
		if (string_upper(prop.name) = string_upper(name)) {
			props.list[i].chance = chance;
			prop.chance = chance;
			break;
		}
	}
}

function generateProp(propX = props.startX) {
	var depthTarget = findPositionDepth(propX);
	for (var i=0; i<array_length(props.list); i++) {
		var propModel = props.list[i];
		
		if (variable_struct_exists(propModel, "collection")) {
			// Create a collection prop
			var propOptions = [];
		
			// Filter out props from the collection by depthLimit
			for (var j=0; j<array_length(propModel.collection); j++) {
				var option = propModel.collection[j];
				if (depthTarget > option.depthLimit) {
					array_push(propOptions, option);	
				}
			}
		
			// From the props remaining, select one at random and create
			var optionCount = array_length(propOptions);
			if (optionCount > 0) {
				var propChoice = propOptions[irandom(optionCount - 1)];
				createProp(propModel.steepnessLimit, propModel.chance, propChoice.sprite, propX);
			}
		
		} else {
			// Create basic prop
			if (depthTarget > propModel.depthLimit) {
				createProp(propModel.steepnessLimit, propModel.chance, propModel.sprite, propX);
			}
		}	
	}	
}

function populateProps() {
	for (var i=props.endX; i<props.startX; i+=abs(move.speed)) {
		generateProp(i);
	}
}

function createProp(steepnessLimit, chance, sprite, propX) {
	if (
		(
			elevation.steepness <= steepnessLimit ||
			steepnessLimit = -1
		) &&
		dice(chance)
	) {
		var _depth = irandom(9);
		// We skip the middle row to prevent weird layering issues with drawing the boat
		if (_depth != props.row.count / 2) {
			var depthIncrement = .1 + (_depth * .1);
			var yy = findY(surfaceWidth - 32, depthIncrement);
			var prop = new Prop(sprite, yy, depthIncrement, propX);
			array_push(props.row.data[_depth], prop);	
		}
	}	
}

function finish() {
	destroyAtEdge = true;
	changeHeight(room_height + 8, 20);
}

function Prop(_sprite, _y, _depth, _x) constructor {
	
	sprite = _sprite;
	index = irandom(sprite_get_number(_sprite) - 1);
	x = _x;
	drawX = _x;
	y = _y + lerp(-32, 28, _depth);
	depth = _depth;
	flip = choose(-1, 1);
}

function findPos(x, depth) {
	var index = x div unit.width;
	var lerpVal = (x mod unit.width) / unit.width;
		
	var yy = lerp(points[index], points[index+1], lerpVal) + lerp(-32, 32, depth);

	var finalX = x + get_perspective(x);
	return {
		x: finalX,
		y: yy
	};
}

function findY_public(x, depth) {
	return findY(x  + margin, depth);
}

function findY(x, depth) {
	var index =  min(x div unit.width, unit.count-1);
	var lerpVal = (x mod unit.width) / unit.width;

	var yy = lerp(points[index], points[index+1], lerpVal);
	return yy;
}

function findX(x, depth) {
	var x1 = x - get_perspective(x);
	var x2 = x + get_perspective(x);
	return floor(lerp(x1, x2, depth));
}

function findPositionDepth(x) {
	var index = floor(x / unit.width);
	return findPointDepth(index);
}

function findPointDepth(index) {
	return points[index] - global.water_y;
}

function heightChangeStart() {
	elevation.change.origin = elevation.change.position;
	elevation.change.lerpPos = 0;
	elevation.change.progress = 0;
	elevation.change.active = true;
}

function changeHeight(targetHeight, durationInSeconds) {
	heightChangeStart();
	elevation.change.target = max(targetHeight, minY);
	elevation.change.rate = getIncrement(durationInSeconds);
	
}

function changeHeightRelative(change, durationInSeconds) {
	heightChangeStart();
	elevation.change.target = max(elevation.change.target + change, minY);
	elevation.change.rate = getIncrement(durationInSeconds);
}

function changeHeightRandom(durationInSeconds) {
	heightChangeStart();
	elevation.change.target = irandom_range(minY, minY + 100);
	elevation.change.rate = getIncrement(durationInSeconds);
}

function generateNextPoint() {
	var yy = elevation.change.position;
	for (var i=0; i<3; i++) {
		var shoveOffset = (360 / 3) * i;
		var shove = .8 + lengthdir_x(.2, elevation.rotStrength + shoveOffset);
		yy += lengthdir_y(elevation.dis[i] * shove, elevation.rot[i]);
		var nudge = 1;
		if (i < 2) {
			nudge = 1 + lengthdir_x(.7, elevation.rot[i+1]);	
		}
		elevation.rot[i] = (elevation.rot[i] +elevation. rotRate[i] * nudge) mod 360;
	}
	return max(yy, minY);	
}


function createBlock(i) {
	var xPos = xMid[i];
	var yPos = points[i];
	var o = instance_create_layer(xPos, yPos, layer, obj_groundBlock);
	o.x = xPos;
	o.init(points[i+1], unit.width, move.speed);
}

function setMidXPosition(index) {
	xMid[index] = -margin + (unit.width * index) + offset;	
}

///@description Generates new stones on the ground texture based on the set config
function createNewStone() {
	var steepnessEvaluation = abs(clamp(elevation.steepness / 50, -1, 1));
	var curveEvaluation = animcurve_channel_evaluate(stoneConfig.curve, steepnessEvaluation);
	var chanceEvaluation = (stoneConfig.chance - 1) * curveEvaluation;
	var roll = dice(
		stoneConfig.chance - chanceEvaluation
	);
	if (roll) {
		var index = irandom(sprite_get_number(stoneConfig.sprite)-1);
		var xx = surfaceWidth - sprite_get_width(stoneConfig.sprite) / 2;
		var yy = irandom_range(0, 64);
		draw_sprite_ext(stoneConfig.sprite, index, xx, yy, choose(-1, 1), 1, 0, c_white, 1);
	}	
}

///@description Updates the stoneConfig
///@param sprite
///@param chance
///@param curve
///@param channelInCurve
function setStoneConfig(_sprite, _chance, _curve, _channel) {
	stoneConfig = {
		sprite: _sprite,
		chance: _chance,
		curve: animcurve_get_channel(_curve, _channel), 
	}
}
#endregion

// Create points
for (var i=0; i<unit.count; i++) {
	var yy = generateNextPoint();
	array_push(points, yy);	
	if (i > 0) {
		array_push(xTop, 0);
		array_push(xLow, 0);
		array_push(xMid, -margin + unit.width * i);
	}
	array_push(texture.xtex, texture.unitWidth * i);
}

for (var i=0; i<unit.count-2; i++) {
	setMidXPosition(i);
	createBlock(i);		
}


// Create front ground layer
front = instance_create_layer(0, 0, layer, ground_front);