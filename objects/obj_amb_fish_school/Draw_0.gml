draw_set_color(c_gold);
draw_set_alpha(1);
draw_circle(avg_x,target_y,4,false);

if (active) {
	shader_set(shd_fadeColor);
		shader_set_uniform_f_array(u_horizon_col,global.c_water_depth_vec3);
	
		for (var i=0; i<fish_num; i++) {
			var fish = fish_list[i];
			shader_set_uniform_f(u_pwr,fish.shd_power);
			draw_sprite_ext(sprite_index,0,fish.x,fish.y,1,fish.flip,fish.angle,global.c_front,image_alpha);
		}
	shader_reset();
}