draw_set_color(c_gold);
draw_set_alpha(1);
draw_circle(target_x,mouse_y,4,false);

if (active) {
	shader_set(shd_island);
		shader_set_uniform_f_array(u_horizon_col,color);
	
		for (var i=0; i<fish_num; i++) {
			var fish = fish_list[i];
			shader_set_uniform_f(u_pwr,fish.shd_power);
			draw_sprite_ext(sprite_index,0,fish.x,fish.y,1,fish.flip,fish.angle,global.c_front,1);
		}
	shader_reset();
}