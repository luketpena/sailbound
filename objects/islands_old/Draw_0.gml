shader_set(shd_fadeColor);
	shader_set_uniform_f_array(u_color, c_sky_space_vec3);
	for (var i=0; i<array_length(island_list); i++) {
		if (instance_exists(island_list[i])) {
			with(island_list[i]) event_perform(ev_draw,0);
		}
	}
shader_reset();
