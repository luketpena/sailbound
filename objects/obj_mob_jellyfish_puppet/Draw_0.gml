draw_primitive_begin_texture(pr_trianglestrip, tailTex);
	var tailOffset = 8 * image_xscale;
	draw_vertex_texture_color(x - tailOffset, y, 0, 0, c_white, 1);
	draw_vertex_texture_color(x + tailOffset, y, 1, 0, c_white, 1);
	draw_vertex_texture_color(tail.x - 8, tail.y, 0, 1, c_white, 1);
	draw_vertex_texture_color(tail.x + 8, tail.y, 1, 1, c_white, 1);
draw_primitive_end();

draw_sprite_ext(spr_mob_jellyfish_head, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(spr_mob_jellyfish_mace, 0, tail.x, tail.y, 1, 1, 0, c_white, 1);
