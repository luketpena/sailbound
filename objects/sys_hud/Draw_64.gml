//----< Main HUD Drawing >----\\
if surface_exists(surf_gui) {
	if (hud_alpha>0) {
		//GUI surface provides pixalation of HUD elements
		surface_set_target(surf_gui);
	
			draw_clear_alpha(c_white,0);
		
			//>> Drawing Functions	
			hud_draw_coins(16,global.vh-16);
			hud_draw_health(8,8,4);
			hud_draw_inventory(48,global.vh-64);
			hud_draw_item(global.vw -96,global.vh-32);

		
		surface_reset_target();
		//Drawing the HUD surfacew
		draw_surface_ext(surf_gui,0,0,1,1,0,c_white,hud_alpha);
			
	}
	
} else {
	surf_gui = surface_create(global.vw,global.vh);	
}

//---- Glowing ----\\
gpu_set_blendmode(bm_add);
	hud_draw_health_glow(8,8,4);
gpu_set_blendmode(bm_normal);