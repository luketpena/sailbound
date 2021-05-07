draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_front,1);

var cannon_index = 8*((lengthdir_x(1,aim_dir)*.5)+.5);

switch(global.item_current) {
	case items.cannon:
		draw_sprite_ext(spr_item_cannon,cannon_index,x,item_y,1,1,aim_dir,c_white,1);
		break;
	case items.boomerang:
		draw_sprite_ext(spr_item_boomerang,0,x,item_y,1,1,0,c_white,1);
		break;
}
