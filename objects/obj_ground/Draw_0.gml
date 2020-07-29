draw_sprite_ext(spr_pixel,0,x-room_hwidth,top,room_width,thickness*2,0,c_orange,1);
draw_set_color(c_red);
physics_draw_debug();

if (surface_exists(surf)) {
	surface_set_target(surf);
		draw_clear_alpha(c_white,0);
		draw_sprite_tiled_ext(spr_checkerboard,0,tex_offset,0,1,1,c_white,1);
	surface_reset_target();
	
	
	var tex = surface_get_texture(surf);
	var left = x-room_hwidth;
	
	
	draw_primitive_begin_texture(pr_trianglestrip,tex);
		for (var i=0; i<=q; i++) {
			
			var xx = left+(unit_w*i);
			var perspective_offset = get_perspective(xx);
			
			draw_vertex_texture_color(xx-perspective_offset,draw_top,tex_w*i,0,global.c_front,1);
			draw_vertex_texture_color(xx+perspective_offset,draw_low,tex_w*i,1,global.c_front,1);
		}
	draw_primitive_end();
} else {
	surf = surface_create(room_width,top_height);
}