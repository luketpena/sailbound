function celestial_set_active(active) {
	sys_sky.celestial_active = active;
}

function Cloud(_lerp, _left, _right) constructor {
	x = random_range(_left, _right);
	y = lerp(global.horizon_y-32, global.horizon_y-128, _lerp);
	color = merge_color(global.c_sky_horizon, global.c_sky_clouds, _lerp);
	size = lerp(.2, 1, _lerp);
	speed = lerp(.01, .2, _lerp);
	image_index = irandom(sprite_get_number(spr_env_sky_clouds)-1);
	image_xscale = lerp(.3, 1, _lerp)*choose(-1, 1);
	image_yscale = lerp(.3, 1, _lerp);
	highlight_alpha = lerp(1, .1, _lerp);
	merge_amount = .2+(.8*_lerp);
	alpha = 1;
}