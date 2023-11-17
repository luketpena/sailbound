gap = irandom_range(96, 128);

height = sprite_height + 64;
y -= 32;
colliderHeight = height - gap;

scrollPosition = irandom(height);
scrollRate = random_range(.5, 1.5);

colliders = [
	instance_create_layer(x, y + scrollPosition, layer, o_mob_lavaFall_collider, { height: colliderHeight }),
	instance_create_layer(x, y + scrollPosition - colliderHeight - gap, layer, o_mob_lavaFall_collider, { height: colliderHeight })
];

image_alpha = .2;
image_blend = c_red;

lightBottom = light_create(0, y + sprite_height, spr_fx_flare_300, 0, 1, 1, c_purple, 1);
lightTop = light_create(0, y, spr_fx_flare_300, 0, 1, 1, c_fuchsia, 1);