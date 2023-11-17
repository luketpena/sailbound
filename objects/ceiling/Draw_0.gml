//// Back half of props

draw_sprite_ext(s_ceilingTransition_test, 0, transitionX, global.water_y, 1, 1, 0, c_white, 1);

shader_set(shd_fadeColor);
shader_set_uniform_f_array(u_color, color_to_vec3(o_ceiling_draw.baseColor));
for (var i = 0;  i< props.row.count/2; i++) {
	for (var j=0; j<array_length(props.row.data[i]); j++) {
		var prop = props.row.data[i][j];
		shader_set_uniform_f(u_pwr, props.row.fade[i]);
		draw_sprite_ext(prop.sprite, prop.index, prop.drawX, prop.y, prop.flip, 1, 0, c_front, 1);
	}	
}
shader_reset();