if (yspeed < 0) yspeed += gravityStr else {
	instance_create_layer(x, y, l_main, o_magmaBomb, {
		yspeed: 0	
	})
	instance_destroy();	
};

y += yspeed;
x -= global.water_speed * .25;