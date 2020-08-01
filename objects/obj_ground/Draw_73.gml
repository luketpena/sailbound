

shader_set(shd_island);
shader_set_uniform_f_array(u_horizon_col,item_color);
shader_set_uniform_f(u_pwr,1);
	for (var i=0; i<itemF_num; i++) {
		var itemF = itemF_array[i];
		
		var xx = findItemX(itemF.x,itemF.rate);
		draw_sprite_ext(itemF.sprite,itemF.image,xx,itemF.y,itemF.flip,1,0,c_white,1);
	}
shader_reset();