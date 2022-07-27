fixture_create_box(id, 4, 4, .5, .1, .1, .1, .2, true, true);
behave_init(behave.bouncer, .1, 4, 1, true, .01, .9, 1, .4, .05, -1);
floater_init(32, 16, true, 4, 5);
lighting_flash_init();

collider = instance_create_layer(x, y, layer, obj_mob_jellyfish_collider);
maceCollider = instance_create_layer(x, y, layer, obj_mob_jellyfish_mace_collider);
puppet = instance_create_layer(x, y, layer, obj_mob_jellyfish_puppet);
collider.target = id;

function triggerBounce() {
	puppet.triggerBounce();
	impactLock = ImpactLock.Up;
	phy_position_y += 8;
	physics_apply_impulse(x, y, 0, 1);
}
