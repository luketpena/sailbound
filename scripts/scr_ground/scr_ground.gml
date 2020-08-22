/*
	item_types requires an array of objects:
	{
		sprite: [sprite_index],
		chance: [number]
	}
	
	Sprite determines what will be drawn, chance determines
	how many sides of the collective die it will claim to
	spawn itself.
*/

function spawn_ground(target_y, ground_sprite, item_types) {
	var thickness = (room_height-target_y)/2;
	var o = instance_create_layer(room_width*2, target_y+thickness, l_main,obj_ground);
	o.init(target_y, ground_sprite, item_types);
}