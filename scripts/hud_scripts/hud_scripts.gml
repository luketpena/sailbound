function hud_draw_coins(x, y) {
	if (coin_alpha>0) {
		//>> Setup
		draw_set_style(global.font_normal_medium,-1,fa_left,fa_middle,-1);
		
		//>> Drawing
		draw_sprite_ext(spr_coin_gold,coin_anim,x,y,coin_size,coin_size,0,c_white,coin_alpha);
		draw_text_color1(x+16,y,round(coin_count),c_white,coin_alpha);
	}
}

function hud_draw_health(x, y, units_in_row) {
	if (hp_alpha>0) {
		//Whole health unites, each representing 4 health
		var unit_num = global.hp_max/4;
	
		//The shader is required for the white flashing health
		shader_set(shd_set_alpha);
			for (var i=0; i<unit_num; i++) {
				//>> Setup
				var xx = x+20*(i mod units_in_row);
				var yy = y+20*(i div units_in_row);
				var frame = clamp(global.hp-(4*i),0,4);
			
				//Determines if it is the highest heart containing health
				var active = (global.hp div 4 = i);
				if (active && hp_shudder>0) xx += lengthdir_x(4*hp_shudder,hp_shudder_rot);
		
				//>> Drawing
				shader_set_uniform_f(u_alpha,hp_alpha);
				draw_sprite_ext(spr_hud_health,frame,xx,yy,1,1,0,c_white,1);
				if (active && hp_shudder>0) draw_sprite_ext(spr_hud_health,5,xx,yy,1,1,0,c_white,hp_shudder);
			}
		shader_reset();
	}
}

function hud_draw_health_glow(x, y, units_in_row) {
	if (hp_glow>0) {
		//>> Setup
		var target = (global.hp-1) div 4;
		var xx = x+20*(target mod units_in_row);
		var yy = y+20*(target div units_in_row);
		
		//>> Drawing
		draw_sprite_ext(spr_fx_flare_300,0,xx+8,yy+8,.2,.2,0,c_hp,hp_glow);
		draw_sprite_ext(spr_hud_health,5,xx,yy,1,1,0,c_white,hp_glow);
	}
}

function hud_draw_inventory(x,y) {
	if (inventory_alpha>0) {
		//>> Setup
		var pos = [[x,y-24], [x+24,y], [x,y+24], [x-24,y]];
	
		//Drawing the D-Pad in center
		draw_sprite_ext(spr_hud_dpad,0,x,y,1,1,0,c_white,inventory_alpha);
	
		//Drawing items in the inventory
		for (var i=0; i<4; i++) {	
			if (global.inventory[i].active) {
				draw_sprite_ext(global.inventory[i].sprite_index,0,pos[i][0],pos[i][1],1,1,0,c_white,inventory_alpha);
			}
		}
	}
}

function hud_draw_item(x,y) {
	if (item_alpha>0) {
		//Draws the equipped item HUD, not the inventory
		if (global.item_current!=-1) {	
			//Setting up the position
			var icon_x = x;
		
			if (!item_singleUse) {
				//Drawing the ammo count if not a single-use item
				draw_set_style(global.font_numbers_large, -1, fa_center, fa_middle, -1);
				draw_text_color1(x+48,y,global.item_ammo,color,item_alpha);
			} else {
				//Offset the icon if single use to account for space taken by ammo count
				icon_x += 32;
			}
		
			//>> Drawing
			var hud_icon = global.item_list.get_item(global.item_current).hud_icon;
			draw_sprite_ext(hud_icon,0,icon_x,y,1,1,0,c_white,item_alpha);	
		}
	}
}