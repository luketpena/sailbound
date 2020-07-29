/// @description Insert description here
// You can write your code in this editor

var draw_y = y-8+2*tilt;
var draw_x = x-8;

draw_sprite_ext(spr_itembox_top,0,draw_x,draw_y,   1,tilt,0,global.c_front,1);
draw_sprite_ext(spr_itembox_top,0,draw_x,draw_y+12,1,tilt,0,global.c_front,1);
draw_sprite_ext(spr_itembox_side,0,draw_x,draw_y,1,1,0,global.c_front,1);

var icon = global.item_list.get_item(item).icon;
draw_sprite_ext(icon,1,draw_x+8,draw_y+8,1,1,0,global.c_front,1);
