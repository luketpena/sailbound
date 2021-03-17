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