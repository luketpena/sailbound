/// @description Use Item

switch(global.item_current) {
	case items.cannon:
		var ox = x+lengthdir_x(12,aim_dir);
		var oy = item_y+lengthdir_y(12,aim_dir);
	
		create_effect(ox,oy,"l_items",spr_fx_cannon_poof,0,1,global.c_front,1,1,1,aim_dir);
		light_create(ox,oy,spr_fx_flare_300,0,.5,.5,c_orange,1,-1,.1);
	
		var o = instance_create_layer(ox,oy,l_main,obj_item_cannon_cannonball);	
		o.phy_speed_x = lengthdir_x(5,aim_dir);
		o.phy_speed_y = lengthdir_y(5,aim_dir);
	
		x += lengthdir_x(4,aim_dir-180);
		y += lengthdir_y(4,aim_dir-180);
		
		camera_set_shove(8,aim_dir+180);
		camera_set_shudder(8);
		vibrate_set_impulse(.5);
		break;
		
	case items.boomerang:
	
		var o = instance_create_layer(x,item_y,"l_items",obj_item_boomerang);	
		o.move_dir = aim_dir;
	
		x += lengthdir_x(4,aim_dir-180);
		y += lengthdir_y(4,aim_dir-180);
		
		break;
}

global.item_ammo--
if (global.item_ammo=0) {
	global.item_current = -1;
}
