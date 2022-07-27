if (active && global.boat_canTouch) {
	if (global.boat_canDamage) {
		boat_impact(270,4);
		health_increment(-2);
	}
	
	var halves = [-1,-1];
	halves[0] = instance_create_layer(x,y,"l_main",obj_coconut_half);
	halves[1] = instance_create_layer(x,y,"l_main",obj_coconut_half);
	
	halves[0].sprite_index = spr_coconut_half_top;
	halves[1].sprite_index = spr_coconut_half_bottom;
	
	for (var i=0; i<2; i++) {
		halves[i].phy_rotation = phy_rotation;
		halves[i].phy_speed_x = random_range(-1,1);
		halves[i].phy_speed_y = random_range(-1,-2);
	}
	
	instance_destroy();
}