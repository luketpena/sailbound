///@description Creates and binds a box fixture to an object

function fixture_create_box(target_id, halfWidth, halfHeight, density, restitution, linear_damping, angular_damping, friction, sensor, fixed_rotation) {

	var fix = physics_fixture_create();
	physics_fixture_set_box_shape(fix,halfWidth,halfHeight);
	physics_fixture_set_density(fix,density);
	physics_fixture_set_restitution(fix,restitution);
	physics_fixture_set_linear_damping(fix,linear_damping);
	physics_fixture_set_angular_damping(fix,angular_damping);
	physics_fixture_set_friction(fix,friction);
	physics_fixture_set_sensor(fix,sensor);
	
	physics_fixture_bind(fix,target_id);
	target_id.phy_fixed_rotation = fixed_rotation;
	
	physics_fixture_delete(fix);
}

function fixture_create_circle(target_id,radius,density,restitution,linear_damping,angular_damping,friction,sensor,fixed_rotation) {
	
	var fix = physics_fixture_create();
	physics_fixture_set_circle_shape(fix,radius);
	physics_fixture_set_density(fix,density);
	physics_fixture_set_restitution(fix,restitution);
	physics_fixture_set_linear_damping(fix,linear_damping);
	physics_fixture_set_angular_damping(fix,angular_damping);
	physics_fixture_set_friction(fix,friction);
	physics_fixture_set_sensor(fix,sensor);
	
	physics_fixture_bind(fix,target_id);
	target_id.phy_fixed_rotation = fixed_rotation;
	
	physics_fixture_delete(fix);
}