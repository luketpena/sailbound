offset = 0;
boundFix = noone;
margin = surfaceInstance.margin;

function init(targetY) {
	assignFixture(targetY);
	phy_fixed_rotation = true;
	phy_active = true;
}

function assignFixture(_targetY) {
	var _edgeY = ceilingMode ? -room_height : room_height + 64;

	var fix = physics_fixture_create();
	physics_fixture_set_polygon_shape(fix);
	
	if (ceilingMode) {
		physics_fixture_add_point(fix, 0, _edgeY);
		physics_fixture_add_point(fix, width, _edgeY);
		physics_fixture_add_point(fix, width, _targetY - y);
		physics_fixture_add_point(fix, 0, 0);
	} else {
		physics_fixture_add_point(fix, 0, 0);
		physics_fixture_add_point(fix, width, _targetY - y);
		physics_fixture_add_point(fix, width, _edgeY);
		physics_fixture_add_point(fix, 0, _edgeY);	
	}
	
	physics_fixture_set_density(fix, 0);
	physics_fixture_set_collision_group(fix, 0);
	boundFix = physics_fixture_bind(fix, id);	
}
