// Base color
draw_sprite_ext(s_pixel,0,x-hlength,top,length,thickness*2,0,c_water_depth,1);

// Draw ground texture
if (surface_exists(surf_detail) && surface_exists(surf_detail_transfer)) {
	
	// Save texture to separate surface, offset by movement speed
	surface_set_target(surf_detail_transfer);
	
		draw_clear_alpha(c_black,0);
		draw_surface_ext(surf_detail,-detail_move,0,1,1,0,c_white,1);
		
	surface_reset_target();
	
	// Draw the main texture
	surface_set_target(surf_detail);
	
		draw_clear_alpha(c_black,0);
		draw_surface_ext(surf_detail_transfer,0,0,1,1,0,c_white,1);
		
		for (var i=0; i<array_length(debris_types); i++) {
			var debris = debris_types[i];
			drawDebris( debris.sprite, debris.chance );
		}
		
	surface_reset_target();
	
} else {
	if (!surface_exists(surf_detail)) surf_detail = surface_create(length,top_h);
	if (!surface_exists(surf_detail_transfer)) surf_detail_transfer = surface_create(length,top_h);
}
// END draw ground texture

// Draw ground
if (surface_exists(surf) && active) {
	
	surface_set_target(surf);
		
		draw_clear_alpha(c_white,0);
		draw_sprite_tiled_ext(ground_sprite,0,tex_offset,0,1,1,c_front,1);
		
		if (surface_exists(surf_detail)) {
			draw_surface_ext(surf_detail,0,0,1,1,0,c_front,1);	
		}
		
		draw_sprite_ext(spr_ground_fade,0,0,0,length,1,0,c_water_depth,1);
		draw_sprite_ext(spr_ground_fade_edge,0,0,0,1,1,0,c_water_depth,1);
		draw_sprite_ext(spr_ground_fade_edge,0,length,0,-1,1,0,c_water_depth,1);
		
		
		if (!global.ko) {
			draw_shadow(global.boat_x,global.boat_y,left,48);
		}
		
	surface_reset_target();
	
	
	var tex = surface_get_texture(surf);
	shader_set(shd_maxAlpha);
	//>> Top
	draw_primitive_begin_texture(pr_trianglestrip,tex);
		for (var i=0; i<=q; i++) {
			
			var xx = left+(unit_w*i);
			var offset = get_perspective(xx)*2;
			
			draw_vertex_texture_color(xx-offset,draw_top,tex_w*i,0,c_white,1);
			draw_vertex_texture_color(xx,top,tex_w*i,.5,c_white,1);
		}	
	draw_primitive_end();
	shader_reset();
	
	draw_edge(top-16,edge_sprite,.8,merge_color(c_front,c_water_depth,.5),0);
	draw_edge(top,edge_sprite,1,c_front,1);
	
	shader_set(shd_maxAlpha);
	
	//>> Bottom
	draw_primitive_begin_texture(pr_trianglestrip,tex);
		for (var i=0; i<=q; i++) {
			
			var xx = left+(unit_w*i);
			var offset = get_perspective(xx);
			
			draw_vertex_texture_color(xx,top,tex_w*i,.5,c_white,1);
			draw_vertex_texture_color(xx+offset,draw_low,tex_w*i,1,c_white,1);
		}	
	draw_primitive_end();
	shader_reset();
	
	draw_edge(top+16, edge_sprite, 1.2, merge_color(c_front, c_water_depth, .25), 2);
	 
	//>> Draw Items
	shader_set(shd_fadeColor);
	shader_set_uniform_f_array(u_color, c_water_depth_vec3);
		for (var i=0; i<array_length(item_array); i++) {
			var item = item_array[i];
			var xx = findItemX(item.x,item.depth);
			if (xx > view_left && xx < view_right) {
				shader_set_uniform_f(u_pwr,item.shd_power);
				draw_sprite_ext(item.sprite,item.image,xx,item.y,item.flip*item.scale,item.scale,0,c_front,1);
			}
		}
	shader_reset();
} else {
	surf = surface_create(length,top_h);
}
// END draw ground