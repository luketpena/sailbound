front = obj_boat_front;
back = obj_boat_back;

lighting_flash_init();


draw_active = true;

anim_sprite = -1;
anim_duration = -1;
anim_loop = false;
anim_speed = 0;
anim_index = 0;
anim_number = 0;

squish = 1;

hull_angle = 0;
sail_angle = hull_angle;
sailor_angle = (-hull_angle-180)*.5;

sail_pos = [
	x+lengthdir_x(8,hull_angle+180),
	y+lengthdir_y(8,hull_angle+180)
];

head_sprite = spr_peter_head_happy;
head_frame = 0;

head_pos = [
	x+lengthdir_x(6*squish,sailor_angle+90),
	y+lengthdir_y(6*squish,sailor_angle+90),
];

hat_y = head_pos[1];
hat_gravity = 0;
hat_locked = true;

//>> Flickering when invulnerable after damage
dmgFlicker_flip = false;
dmgFlicker_flip_alarm = 0; //Determines when the flicker flips on or off
dmgFlicker_alarm = -1; //Determines when the entire thing ends

scr_shadow_init(48,128);