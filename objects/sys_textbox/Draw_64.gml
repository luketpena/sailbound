/*
if surface_exists(surf_textbox) {
	surface_set_target(surf_textbox);
	
		draw_clear_alpha(c_black,0);
		

		draw_set_font(global.font_normal_small);
		draw_set_color(c_white);
		draw_set_alpha(1);
		
		draw_primitive_begin(pr_trianglefan);
		
			draw_vertex(bkg_c[0],bkg_c[1]);
			
			for (var i=0; i<8; i++) {
				var point = bkg_point[i];
				draw_vertex(point[0],point[1]);
			}
			
			var closer = bkg_point[0];
			draw_vertex(closer[0],closer[1]);
		draw_primitive_end();		
		
		//Draw the genie tail
		if (genie_lerp>0) {
			var point_x = o_boat_main.x_center_draw-global.vx;
			draw_primitive_begin(pr_trianglelist)
				var genie_y, point_y;
				var genie_w = 12;
				if (side="top") {
					genie_y = bottom-8;
					point_y = bottom-8+(24*genie_lerp);
				} else {
					genie_y = top+8;
					point_y = top+8-(24*genie_lerp);
				}
				draw_vertex( clamp(point_x-genie_w,left+4,right-4-(genie_w*2)), genie_y );
				draw_vertex( clamp(point_x+genie_w,left+4+(genie_w*2),right-4), genie_y );
				draw_vertex( point_x, point_y );
			draw_primitive_end();
		}
			
		draw_set_color(c_plack);
		draw_set_alpha(text_alpha);
		draw_text(left+padding,top+padding,string_copy(string_hash_to_newline(string_upper(text)),0,text_pos));
		

	surface_reset_target();
	
	draw_surface_ext(surf_textbox,0+2,0+4,1,1,0,c_black,.25);

	draw_surface_ext(surf_textbox,0,0,1,1,0,c_white,1);
	
	if (text_complete) draw_sprite_ext(spr_hud_textbox_next,0,right-8,bottom-8,nextButton_size,nextButton_size,lengthdir_x(5,nextButton_rot),c_white,grow);
} else {
	surf_textbox = surface_create(global.vw,global.vh);	
}



if keyboard_check_pressed(vk_space) {
	if (text_complete) event_user(0) else event_user(1);
}

*/
