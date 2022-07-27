offset = 0;
width = 0;
boundFix = noone;
moveSpeed = 0;
margin = ground.margin;

function init(targetY, _width, speed) {
	width = _width;
	moveSpeed = speed;
	assignFixture(targetY, _width);
	phy_fixed_rotation = true;
	phy_active = true;
}

function assignFixture(targetY, _width) {
	var bottomY = room_height + 64;
	var fix = physics_fixture_create();
	physics_fixture_set_polygon_shape(fix);
	physics_fixture_add_point(fix, 0, 0);
	physics_fixture_add_point(fix, width, targetY - y);
	physics_fixture_add_point(fix, width, bottomY);
	physics_fixture_add_point(fix, 0, bottomY);
	
	physics_fixture_set_density(fix, 0);
	physics_fixture_set_collision_group(fix, 0);
	boundFix = physics_fixture_bind(fix, id);	
}
