scr_shadow_step();
lighting_flash_step();

x = obj_boat_front.x_center_draw;
y = obj_boat_front.y_center_draw;

if (obj_boat_front.waterpoint_center<obj_boat_front.y_center_draw-16) {
	head_frame = 3;
	part_particles_create(global.ps_water_front,head_pos[0],head_pos[1],global.pt_water_bubble,1);
} else if (obj_boat_front.phy_speed_y<-3) head_frame = 1
else if (obj_boat_front.phy_speed_y>3) head_frame = 2
else head_frame = 0;



squish += (1+(obj_boat_front.phy_speed_y/20)-squish)*.2;

hull_angle = obj_boat_front.boat_angle_reverse-180;
sail_angle -= angle_difference(sail_angle,hull_angle)*.2;
sailor_angle = hull_angle*.5;

sail_pos = [
	x+lengthdir_x(8,hull_angle),
	y+lengthdir_y(8,hull_angle)
];
/*
	sail_size_lerp = 0;
	sail_size_cloth = 1;
	sail_size_mast = 1;
	sail_active = true;
*/

if (sail_active) {
	if (sail_size_lerp < 1) {
		sail_size_lerp += .025;
		sail_size_mast = ease_lerp(EASE.OutElastic, 0, 1, sail_size_lerp);
		sail_size_cloth = ease_lerp(EASE.OutBack, 0, 1, sail_size_lerp);
	}
} else {
	if (sail_size_lerp > 0) {
		sail_size_lerp -= .05;
		sail_size_mast = ease_lerp(EASE.OutBack, 0, 1, sail_size_lerp);
		sail_size_cloth = 1;
	}
}

if keyboard_check_pressed(vk_control) sail_active = !sail_active;

head_pos = [
	x+lengthdir_x(6*squish,sailor_angle+90),
	y+lengthdir_y(6*squish,sailor_angle+90),
];

if (head_pos[1]<=hat_y) {
	hat_y = head_pos[1];	
	hat_gravity = 0;
} else {
	hat_gravity = min(hat_gravity+.1, 5);
	hat_y += hat_gravity;
}


if (anim_duration>-1) {
	if (anim_duration>0) anim_duration-- else {
		anim_duration = -1;
		anim_sprite = -1;
	}
}

if (anim_sprite!=-1) {
	
	if (anim_loop) {
		anim_index = (anim_index+anim_speed) mod anim_number;	
	} else {
		var anim_end = anim_number;
		anim_index = min(anim_index+anim_speed,anim_end);
		if (anim_index=anim_end) {
			anim_sprite = -1;	
		}
	}
}

if (dmgFlicker_alarm>-1) {
	if (dmgFlicker_alarm>0) {
		dmgFlicker_alarm--;
		if (dmgFlicker_flip_alarm>0) dmgFlicker_flip_alarm-- else {
			dmgFlicker_flip_alarm = .1*room_speed;
			dmgFlicker_flip = !dmgFlicker_flip;
		}
	}else {
		dmgFlicker_alarm = -1;
		dmgFlicker_flip = false;
		global.boat_canDamage = true;
	}
}

draw_active = (!dmgFlicker_flip && !global.ko);