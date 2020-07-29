fixture_create_box(id,8,2,.5,.1,.1,.1,.2,true,false);
behave_init(behave.bouncer,.05,3,1,true,.01,.9,1,.5,.05,-3);
lighting_flash_init();

image_speed = 0;


wait = random_range(2,4)*room_speed;


function init(sprite, index, spd_min, spd_max, dir_min, dir_max, rot_min, rot_max, flashSet) {
	sprite_index = sprite;
	if (index=-1) image_index = irandom(sprite_get_number(sprite)-1) else image_index = index;
	var spd = random_range(spd_min,spd_max);
	var dir = random_range(dir_min,dir_max);
	
	phy_speed_x = lengthdir_x(spd,dir);
	phy_speed_y = lengthdir_y(spd,dir);
	
	phy_angular_velocity = phy_speed_x*random_range(rot_min,rot_max);
	
	flash = flashSet;
}

