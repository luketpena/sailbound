///@description Creates a new set of boat stats
function HullStats(
	verticalStats,
	horizontalStats,
	hullSizeStats,
	hullDrawStats,
	colliderStats,
	wakeStats
) constructor {
	
	hullSprite = hullDrawStats.hullSprite;
	sailSprite = hullDrawStats.sailSprite;
	sailPosAngle = hullDrawStats.sailPosAngle;
	sailPosDistance = hullDrawStats.sailPosDistance;

	width = hullSizeStats.width;
	radiusFront = hullSizeStats.radiusFront;
	radiusBack = hullSizeStats.radiusBack;
	offset = hullSizeStats.offset;

	jumpPower = verticalStats.jumpPower;
	jumpLimit = verticalStats.jumpLimit;
	jumpBackRate = verticalStats.jumpBackRate;
	divePower = verticalStats.divePower;
	diveLimit = verticalStats.diveLimit;
	diveBackRate = verticalStats.diveBackRate;
	buoyancy = verticalStats.buoyancy;
	stop = verticalStats.stop;
	weight = verticalStats.weight;
	
	speed = horizontalStats.speed;
	drag = horizontalStats.drag;
	agility = horizontalStats.agility;
	
	colliderWidth = colliderStats.width;
	colliderHeight = colliderStats.height;
	
	wakeXMin = wakeStats.wakeXMin;
	wakeXMax = wakeStats.wakeXMax;
}

function HullWakeStats(_min, _max) constructor {
	wakeXMin = _min;
	wakeXMax = _max;
}

function HullDrawStats(
	_hullSprite, _sailSprite, _sailPosAngle, _sailPosDistance
) constructor {
	hullSprite = _hullSprite;
	sailSprite = _sailSprite;
	sailPosAngle = _sailPosAngle;
	sailPosDistance = _sailPosDistance;
}

function HullSizeStats(
	_width, _offset, _radiusFront, _radiusBack
) constructor {
	width = _width;
	offset = _offset;
	radiusFront = _radiusFront;
	radiusBack = _radiusBack;
}

function VerticalStats(
	_jumpPower, _jumpLimit, _jumpBackRate, _divePower, _diveLimit, _diveBackRate, _buoyancy, _stop, _weight
) constructor {
	jumpPower = _jumpPower;
	jumpLimit = _jumpLimit;
	jumpBackRate = _jumpBackRate;
	divePower = _divePower;
	diveLimit = _diveLimit;
	diveBackRate = _diveBackRate;
	buoyancy = _buoyancy;
	stop = _stop;
	weight = _weight;
}

function HorizontalStats(
	_speed, _drag, _agility
) constructor {
	speed = _speed;
	drag = _drag;
	agility = _agility;
}

function ColliderStats(_width, _height) constructor {
	width = _width;
	height = _height;
}

function hullSetGameplayStats(
	hullHp
) {
	global.hp_max = hullHp;
	global.hp = global.hp_max;
}



function boat_init_stats() {
	var stats = getActiveShipStats();
	
	//>> Physical Stats
	boat_weight = stats.weight; //gravity strength
	boat_drag = stats.drag; //rate that boat slows down
	boat_buoyancy = stats.buoyancy; //rate that boat is pushed upwards under water
	boat_stop = stats.stop; //speed division on contact with water
	boat_speed = stats.speed; //max speed
	boat_agility = stats.agility; //acceleration rate
	boat_width = stats.width; //distance the two halves are created from each other
	boat_hwidth = boat_width / 2;
	boat_offset = stats.offset; //offset vertically of the radius

	boat_jump_power = stats.jumpPower; //physics impulse upwards on jump
	boat_dive_power = stats.divePower; //physics impulse downwards on dive

	boat_jump_limit = stats.jumpLimit;
	boat_dive_limit = stats.diveLimit;
	
	jumpBackRate = stats.jumpBackRate;
	diveBackRate = stats.diveBackRate;
	
	colliderWidth = stats.colliderWidth;
	colliderHeight = stats.colliderHeight;
	
	hullSprite = stats.hullSprite;
	sailSprite = stats.sailSprite;
	
	sailPosAngle = stats.sailPosAngle;
	sailPosDistance = stats.sailPosDistance;
	
	wakeXMax = stats.wakeXMax;
	wakeXMin = stats.wakeXMin;

	//>> Bonus Stats
	bonus_speed = 0;
	bonus_agility = 0;
	//>> Final Stats
	total_speed = boat_speed + bonus_speed;
	total_agility = boat_agility + bonus_agility;
	//>> Sail Settings
	sail_x = 0;
	sail_y = 0;
}
