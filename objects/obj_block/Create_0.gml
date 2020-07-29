var fix = physics_fixture_create();
physics_fixture_set_density(fix,0);
physics_fixture_set_box_shape(fix,16*image_xscale,16*image_yscale);
physics_fixture_bind(fix,id);
physics_fixture_delete(fix);