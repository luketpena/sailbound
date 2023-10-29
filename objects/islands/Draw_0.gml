shader_set(shd_fadeColor);

array_foreach(islandList, function(_island) {
	shader_set_uniform_f(u_pwr, _island.shaderPower);
	shader_set_uniform_f_array(u_color, c_sky_space_vec3);
	_island.draw();
});

shader_reset();