var anim_length = sprite_get_number(anim_sprite);

switch(state) {
	case "appear":
		if (anim_index<anim_length-1) anim_index += .25 else {
			anim_index = 0;
			anim_sprite = spr_item_repairBuddy_idle;
			state = "idle";
		}
		break;
		
	case "idle":
		anim_index = (anim_index+.25) mod anim_length;
		if (healing_wait>0) healing_wait-- else {
			healing_wait = healing_wait_set;
			healing_count--;
			move_offset_x = random_range(-24,24);
			move_offset_y = random_range(-12,12);
			
			if (global.hp<global.hp_max) {
				if (healing_count>0) {
					//Healing up to max
					health_increment(1);	
					obj_boat_draw.flash = .9;
				} else {
					//Final heal
					boat_heal(1);
				}
			} else {
				//Flashes only when health is full
				obj_boat_draw.flash = .9;
			}
			part_particles_create(global.ps_fx_glow,x+8*image_xscale,y,global.pt_spark,8);
		}
		
		x += (obj_boat_front.x_center_draw+move_offset_x-x)*.1;		
		y += (obj_boat_front.y_center_draw+move_offset_y-y)*.1;		
		
		facing_direction();
		
		if (healing_count=0) {
			anim_index = 0;
			anim_sprite = spr_item_repairBuddy_pop;
			state = "pop";
		}
		break;
		
	case "pop":
		if (anim_index<anim_length-1) anim_index += .25 else {
			instance_destroy();	
		}
		break;
}