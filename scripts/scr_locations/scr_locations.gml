// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawn_location(sprite,image){
	var o = instance_create_layer(room_width,global.water_y,l_main,obj_location);
	o.sprite_index = sprite;
	o.image_index = image;
}