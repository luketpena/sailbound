x += xspeed;
y += yspeed;

yspeed += .1;

part_emitter_region(global.ps_fx_glow, pe, x-2, x+2, y-2, y+2, ps_shape_ellipse, ps_distr_gaussian);

var water_y = water_find_y_basic(x);
if (y > water_y) instance_destroy();

if (life>0) {
	life--;
	var scale = (life/life_set);
	part_type_size(pt, scale*.8, scale*1.2, 0, 0);
} else {
	if (end_delay>0) end_delay-- else instance_destroy();
}