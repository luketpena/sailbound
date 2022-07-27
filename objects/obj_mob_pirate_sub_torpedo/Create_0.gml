fixture_create_box(id, 8, 8, .1, 0, 0, 0, 0, true, true);

state = "launch";
moveSpeed = -1.5;
targetMoveSpeed = 5;
waterY = water_find_y_basic(x);
submerged = true;

image_speed = 0;
image_index = 3;

function explode(snapToWater = true) {
	var yy = snapToWater ? waterY : y;
	instance_create_layer(x, yy, layer, obj_fx_explosion_damage);
	instance_destroy();
}
