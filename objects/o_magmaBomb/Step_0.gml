var _waterY = water_find_y_basic(x);

if (submerged) {
	if (_waterY > y) submerged = false;
} else {
	if (yspeed < gravityMax) yspeed += gravityStr;
}

// Colliding with the water
if (yspeed > 0) {
	if (y > _waterY) {
		instance_create_layer(x, y, l_main, obj_fx_explosion_damage);
		instance_destroy();	
	}
}

y += yspeed;
x -= global.water_speed * .25;