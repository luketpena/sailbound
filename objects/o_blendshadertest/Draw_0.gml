var color = color_to_vec3(c_red);

shader_set(shd_blendTileLayers);
	shader_set_uniform_f_array(u_color, color);
	draw_self();
shader_reset();