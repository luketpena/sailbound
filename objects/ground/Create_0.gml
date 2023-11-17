// Inherit the parent event
event_inherited();

// Create front ground layer
front = instance_create_layer(0, 0, layer, ground_front);
front.target = id;