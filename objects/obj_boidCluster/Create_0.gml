
children = [];
startDirection = irandom(360);
active = false;

targetActive = false;
target = new Pos();
config = null;
targetTimer = null; 
count = null;

function setTarget() {
	target.x = random(room_width);
	target.y = random_range(config.targetRangeY.MIN, config.targetRangeY.MAX);
	targetActive = true;
}

///@param configScript
function init(_config) {
	// Load config
	config = script_execute(_config);
	// Set group settings
	targetTimer = irandom_range(config.targetTimerRange.MIN, config.targetTimerRange.MAX) * room_speed;
	count = irandom_range(config.count.MIN, config.count.MAX);
	// Generate boids
	for (var i=0; i<count; i++) {
		var o = new Boid(x, y, id, i, config);
		var dir = startDirection + irandom_range(-10, 10);
		o.dx = lengthdir_x(o.speedLimit, dir);
		o.dy = lengthdir_y(o.speedLimit, dir);
		o.clusterDepth = i / count;
		array_push(children, o);
	}
	// Trigger active
	active = true;
}

var _myConfig = choose(boidConfig_goldFish, boidConfig_redFish, boidConfig_blueFish);
init(_myConfig);