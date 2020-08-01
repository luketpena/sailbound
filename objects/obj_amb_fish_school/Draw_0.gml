draw_set_color(c_gold);
draw_set_alpha(1);
draw_circle(avg_x,y,4,false);

if (active) {
	shader_set(shd_island);
		shader_set_uniform_f_array(u_horizon_col,color);
	
		for (var i=0; i<fish_num; i++) {
			var fish = fish_list[i];
			shader_set_uniform_f(u_pwr,fish.shd_power);
			draw_sprite_ext(sprite_index,0,fish.x,fish.y,1,fish.flip,fish.angle,global.c_front,image_alpha);
		}
	shader_reset();
}