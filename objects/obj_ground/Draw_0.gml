draw_sprite_ext(spr_pixel,0,x-hlength,top,length,thickness*2,0,global.c_water_depth,1);

function draw_edge(_y,_sprite,_depth, _blend) {
	var edge_x = findItemX(-edge_buffer,_depth);
	draw_sprite_ext(_sprite,0,edge_x,_y,1,1,0,_blend,1);
	draw_sprite_ext(_sprite,1,edge_x,_y,1,1,0,global.c_water_depth,1);
}

function draw_shadow(_x,_y,offset,rad) {
	var xx = _x-offset;
	var scale = max( 1-((top-_y)/128) , 0) * (rad/128);
	draw_sprite_ext(spr_env_water_displace,0,xx,center_y,scale,scale,0,global.c_water_depth,.5);
}

if (surface_exists(surf_detail) && surface_exists(surf_detail_transfer)) {
	
	function drawDebris(sprite, chance) {
		
		if (dice(chance)) {
			var index = irandom(sprite_get_number(sprite)-1);
			var flip = choose(-1,1);
			var xx = (length)-sprite_get_width(sprite)/2
			var yy = random(top_h);
			
			draw_sprite_ext(sprite,index,xx-distanceToCenter,yy,flip,1,0,c_white,1);
		}
	}
	
	if (state="static") detail_move = abs(detail_move-1) else detail_move = 0;
	
	surface_set_target(surf_detail_transfer);
		draw_clear_alpha(c_black,0);
		draw_surface_ext(surf_detail,-detail_move,0,1,1,0,c_white,1);
	surface_reset_target();
	
	surface_set_target(surf_detail);
		draw_clear_alpha(c_black,0);
		draw_surface_ext(surf_detail_transfer,0,0,1,1,0,c_white,1);
		
		drawDebris(spr_ground_debris_coral_stone_large,100);
		drawDebris(spr_ground_debris_seaweed,60);
		
		
	surface_reset_target();
	
	
	
} else {
	if (!surface_exists(surf_detail)) surf_detail = surface_create(length,top_h);
	if (!surface_exists(surf_detail_transfer)) surf_detail_transfer = surface_create(length,top_h);
}

if (surface_exists(surf) && active) {
	
	var left = phy_position_x-hlength;
	
	surface_set_target(surf);
		
		draw_clear_alpha(c_white,0);
		draw_sprite_tiled_ext(spr_sand,0,tex_offset,0,1,1,global.c_front,1);
		
		if (surface_exists(surf_detail)) {
			draw_surface_ext(surf_detail,0,0,1,1,0,global.c_front,1);	
		}
		
		draw_sprite_ext(spr_ground_fade,0,0,0,length,1,0,global.c_water_depth,1);
		draw_sprite_ext(spr_ground_fade_edge,0,0,0,1,1,0,global.c_water_depth,1);
		draw_sprite_ext(spr_ground_fade_edge,0,length,0,-1,1,0,global.c_water_depth,1);
		
		
		if (!global.ko) {
			var xx = (global.boat_x)-left;
			//draw_sprite_ext(spr_pixel,0,xx,0,1,top_h,0,c_red,1);
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
	
	draw_edge(top-16,spr_ground_coral_edge,.8,merge_color(global.c_front,global.c_water_depth,.5));
	draw_edge(top,spr_ground_coral_edge,1,global.c_front);
	
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
	

	draw_edge(draw_low,spr_ground_coral_edge,1.5,merge_color(global.c_front,global.c_water_depth,.5));
	
	//>> Draw Items
	shader_set(shd_island);
	shader_set_uniform_f_array(u_horizon_col,item_color);
		for (var i=0; i<item_num; i++) {
			var item = item_array[i];
			shader_set_uniform_f(u_pwr,item.shd_power);
			var xx = findItemX(item.x,item.depth);
			draw_sprite_ext(item.sprite,item.image,xx,item.y,item.flip*item.scale,item.scale,0,global.c_front,1);
		}
	shader_reset();
} else {
	surf = surface_create(length,top_h);
}
