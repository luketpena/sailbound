if instance_exists(parent) && surface_exists(parent.surf) {
	draw_sprite_ext(s_pixel, 0, x, y - 12, parent.width, parent.height + 12, 0, $411a1e, 1);
	var tex = surface_get_texture(parent.surf);
	shader_set(shd_maxAlpha);
	draw_primitive_begin_texture(pr_trianglestrip, tex);
		draw_vertex_texture_color(x, y - 12, 0, 0, c_white, 1);
		draw_vertex_texture_color(parent.right, y - 12, 1, 0, c_white, 1);
		draw_vertex_texture_color(x, y, 0, .5, c_white, .9);
		draw_vertex_texture_color(parent.right, y, 1, .5, c_white, .9);
	draw_primitive_end();
	shader_reset();
}