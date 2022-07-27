function test() {
	effect_create_above(ef_flare,mouse_x,mouse_y,1,c_red);
}

function testx1(x, y) {
	effect_create_above(ef_flare, x, y, 1, c_red);
}

function testx2(x, y, col) {
	effect_create_above(ef_flare, x, y, 1, col);
}

function testx3(x, y, col, ef) {
	effect_create_above(ef, x, y, 1, col);
}

function log() {
	if (argument_count > 1) {
		for (var i=0; i<argument_count; i++) {
			show_debug_message(argument[i]);	
		}
	} else {
		show_debug_message(argument[0]);
	}
}