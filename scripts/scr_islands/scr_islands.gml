function island_get_sprite(biome) {
	switch(biome) {
		case biomes.tropical: return spr_islands_tropical;
		case biomes.skull: return spr_islands_spiked;
		case biomes.arctic: return spr_islands_iceberg;
		default: return -1;
	}
}

function island_spawn_ext(in_position, biome, speed_min, speed_max, image, _x, _y, xscale) {
	
	var sprite = island_get_sprite(biome);
	var sprite_hw = sprite_get_width(sprite)/2;
	var xx = _x;
	var yy = _y;
	var o = instance_create_layer(xx,yy,l_main,obj_island_standard);
	
	with(o) {
		shader_pwr = lerp(1,.2,in_position);
		position = in_position;
		mov_speed = lerp(speed_min, speed_max, in_position);
		exit_x = global.vx-sprite_hw;
		
		var size = lerp(.25,1,in_position);
		image_xscale = xscale;
		image_yscale = size;
		depth += (1-in_position);
		
		sprite_index = sprite;
		image_index = image;
	}

	return o;
}

function island_spawn(in_position, biome, speed_min, speed_max) {
	var sprite = island_get_sprite(biome);
	var sprite_hw = sprite_get_width(sprite)/2;
	var image = irandom(sprite_get_number(sprite)-1);
	var xx = global.vr+sprite_hw;
	var yy = floor(global.horizon_y+16*in_position);
	var xscale = choose(-1, 1);
	return island_spawn_ext(in_position, biome, speed_min, speed_max, image, xx, yy, xscale);
}
