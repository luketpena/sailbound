///@description Creates a small splash
///@param x
///@param width
///@param small/medium/large
function water_splash_create_double(x, halfWidth, size) {
	
	var o = instance_create_layer(x,0,l_main,obj_splash_double);
	switch(size) {
		case "small":
			o.sprite_index = spr_fx_water_splash_small_1;
			o.spr_left  = spr_fx_water_splash_small_1;
			o.spr_right = spr_fx_water_splash_small_2;
			break;
		
		case "medium":
			o.sprite_index = spr_fx_water_splash_medium_1;
			o.spr_left  = spr_fx_water_splash_medium_1;
			o.spr_right = spr_fx_water_splash_medium_2;
			break;
		
		case "large":
			o.sprite_index = spr_fx_water_splash_large_1;
			o.spr_left  = spr_fx_water_splash_large_1;
			o.spr_right = spr_fx_water_splash_large_2;
			break;
	}

	o.halfWidth = halfWidth;
	with(o) event_user(0); //Activate the splash
}

function water_splash_create_single(x, face, size) {

	var o = instance_create_layer(x,0,l_main,obj_splash_single);
	switch(size) {
		case "small": o.sprite_index = choose(spr_fx_water_splash_small_1,spr_fx_water_splash_small_2); break;
		case "medium": o.sprite_index = choose(spr_fx_water_splash_medium_1,spr_fx_water_splash_medium_2); break;		
		case "large": o.sprite_index = choose(spr_fx_water_splash_large_1,spr_fx_water_splash_large_2); break;
	}

	o.image_xscale = face;
	with(o) event_user(0);
}


function water_splash_create_particles(x, halfWidth) {

	var left = x-halfWidth;
	var right = x+halfWidth;

	var hleft = water_find_y_basic(left);
	var hright = water_find_y_basic(right);

	var dis = right-left;
	var dir = point_direction(left,hleft,right,hright); 

	//The number of particles is based on the distance between the two sides
	repeat(dis/2) {
		var length = random(dis);
		part_particles_create(
			global.ps_fx_above,
			left+lengthdir_x(length,dir),
			hleft+lengthdir_y(length,dir),
			global.pt_water_splash,1);
	}
}

