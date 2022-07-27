function comboIncrement(value = 1) {
	global.combo += value;
	var dir = random(360)
	if (global.combo > 1) {
		createComboCounter(
			obj_boat_front.x_center_draw + lengthdir_x(64, dir),
			obj_boat_front.y_center_draw + lengthdir_y(64, dir),
		);
	}
}

function comboEnd() {
	if (global.combo > 1) {
		boat_heal(global.combo - 1);
	}
	global.combo = 0;
}

function createComboCounter(x, y) {
	return instance_create_layer(x, y, l_main, obj_comboCounter);	
}