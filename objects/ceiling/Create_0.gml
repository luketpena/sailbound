backdrop = instance_create_layer(0, 0, layer, o_cave_backdrop)
event_inherited();

// Create front ground layer
front = instance_create_layer(0, 0, layer, o_ceiling_draw);
front.target = id;