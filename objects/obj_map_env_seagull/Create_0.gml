minHeight = irandom_range(24, 48);
maxHeight = minHeight;

image_angle = random(360);
moveSpeed = random_range(.25, .75);

shadow = instance_create_layer(x, y, "l_shadows", obj_map_shadow);
shadow.sprite_index = sprite_index;

target = instance_nearest(x, y, prnt_map_stackedObject);
targetTimer = 0;
targetTimerMax = 3 * room_speed;
targetTimerMin = 1 * room_speed;

targetX = x;
targetY = y;

targetRadius = 32;

turnRate = random_range(.005, .02);