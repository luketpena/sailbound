function island_get_sprite(biome) {
	switch(biome) {
		case biomes.tropical: return spr_islands_tropical;
		case biomes.skull: return spr_islands_spiked;
		case biomes.arctic: return spr_islands_iceberg;
		default: return -1;
	}
}

function island_spawn_standard(in_position,biome) {
	
	var sprite = island_get_sprite(biome);
	var sprite_hw = sprite_get_width(sprite)/2;
	var xx = global.vr+sprite_hw;
	var yy = floor(global.horizon_y+16*in_position);
	var o = instance_create_layer(xx,yy,l_main,obj_island_standard);
	
	with(o) {
		shader_pwr = lerp(1,.2,in_position);
		position = in_position;
		mov_speed = lerp(-.1,-.3,in_position);
		exit_x = global.vx-sprite_hw;
		
		var size = lerp(.25,1,in_position);
		image_xscale = choose(-1,1)*size;
		image_yscale = size;
		depth += (1-in_position);
		
		sprite_index = sprite;
		image_index = irandom(sprite_get_number(sprite_index)-1);
	}

	return o;
}