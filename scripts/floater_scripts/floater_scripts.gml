function floater_init(width, height, rot_active, rot_distance, rot_speed) {
	floater = instance_create_layer(x,y,"l_main",obj_floater);
	
	floater.width = width;
	floater.height = height;
	floater.rot_active = rot_active;
	floater.rot_distance = rot_distance;
	floater.rot_speed = rot_speed;

	if (floater.rot_active) {
		floater.rot = irandom(360);
		floater.rot_offset = 4/floater.sprite_width;
	}
	floater.size = floater.width/floater.sprite_width;
	floater.image_xscale = floater.size*floater.waterpoint_dis;
	floater.image_yscale = floater.image_xscale;
}

function floater_cleanup() {
	if instance_exists(floater) {
		floater.active = false;
	}
}

function floater_step(offset_y) {
	if instance_exists(floater) {
		floater.x = x+1;
		if (offset_y) floater.y = y+offset_y else floater.y = y;
	}
}