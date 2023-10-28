if (surface_exists(surf_posterize)) {
	shader_set(shd_bwToColorGrad);
		shader_set_uniform_f_array(u_color1, color1);
		shader_set_uniform_f_array(u_color2, color2);
		draw_surface_ext(surf_posterize, x, y, 1, 1, 0, c_white, 1);	
	shader_reset();
	map_water_draw_gradient();
}