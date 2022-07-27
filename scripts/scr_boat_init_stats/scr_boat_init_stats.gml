///@description Creates a new set of boat stats
function HullStats(
	verticalStats,
	horizontalStats,
	hullSizeStats,
	hullDrawStats,
	colliderStats
) constructor {
	
	hullSprite = hullDrawStats.hullSprite;
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
}

function HullDrawStats(
	_hullSprite, _sailPosAngle, _sailPosDistance
) constructor {
	hullSprite = _hullSprite;
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

function SailStats(_sailSprite) constructor {
	sailSprite = _sailSprite;
}

function hullStats_classic() {
	hullSetGameplayStats(20);
	return new HullStats(
		new VerticalStats(40, 6, .8, 30, 5, .8, .6, 4, 80),
		new HorizontalStats(2, .95, 3),
		new HullSizeStats(48, 10, 4, 4),
		new HullDrawStats(spr_hull_classic, 180, 8),
		new ColliderStats(28, 12),
	);
}

function hullStats_raft() {
	hullSetGameplayStats(12);
	return new HullStats(
		new VerticalStats(30, 7, .9, 20, 5, 1, .7, 6, 65),
		new HorizontalStats(2, .95, 3),
		new HullSizeStats(32, 10, 4, 4),
		new HullDrawStats(spr_hull_raft, 180, 8),
		new ColliderStats(30, 8),
	);
}

function sailStats_classic() {
	return new SailStats(spr_sail_classic);	
}

function sailStats_raft() {
	return new SailStats(spr_sail_raft);	
}

function boat_init_stats(hullStats, sailStats) {
	//>> Physical Stats
	boat_weight = hullStats.weight; //gravity strength
	boat_drag = hullStats.drag; //rate that boat slows down
	boat_buoyancy = hullStats.buoyancy; //rate that boat is pushed upwards under water
	boat_stop = hullStats.stop; //speed division on contact with water
	boat_speed = hullStats.speed; //max speed
	boat_agility = hullStats.agility; //acceleration rate
	boat_width = hullStats.width; //distance the two halves are created from each other
	boat_hwidth = boat_width / 2;
	boat_offset = hullStats.offset; //offset vertically of the radius

	boat_jump_power = hullStats.jumpPower; //physics impulse upwards on jump
	boat_dive_power = hullStats.divePower; //physics impulse downwards on dive

	boat_jump_limit = hullStats.jumpLimit;
	boat_dive_limit = hullStats.diveLimit;
	
	jumpBackRate = hullStats.jumpBackRate;
	diveBackRate = hullStats.diveBackRate;
	
	colliderWidth = hullStats.colliderWidth;
	colliderHeight = hullStats.colliderHeight;
	
	sailSprite = sailStats.sailSprite;
	hullSprite = hullStats.hullSprite;
	
	sailPosAngle = hullStats.sailPosAngle;
	sailPosDistance = hullStats.sailPosDistance;

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
