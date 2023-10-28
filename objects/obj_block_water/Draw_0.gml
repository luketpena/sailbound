
draw_set_alpha(1);
if surface_exists(surf) {
	surface_set_target(surf);
		draw_clear_alpha($fa7d02, 1);
		draw_sprite_tiled_ext(spr_town_env_water_pattern, 0, waterPos, 0, 1, 1, c_white, .5);
		draw_sprite_tiled_ext(spr_town_env_water_pattern, 1, waterPos + lengthdir_x(16, waterRot), 0, 1, 1, c_white, .25);
		draw_sprite_ext(s_pixel, 0, 0, 23, width, 1, 0, c_white, 1);
	surface_reset_target();
	
	var tex = surface_get_texture(surf);
	shader_set(shd_maxAlpha);
	draw_primitive_begin_texture(pr_trianglestrip, tex);
		draw_vertex_texture_color(x, y, 0, .5, c_white, .9);
		draw_vertex_texture_color(right, y, 1, .5, c_white, .9);
		draw_vertex_texture_color(x, y + 12, 0, 1, c_white, .7);
		draw_vertex_texture_color(right, y + 12, 1, 1, c_white, .7);
	draw_primitive_end();
	shader_reset();
	
	draw_sprite_ext(s_pixel, 0, x, y + 12, width, height, 0, $fa7d02, .5);
} else {
	surf = surface_create(width, 24);
}