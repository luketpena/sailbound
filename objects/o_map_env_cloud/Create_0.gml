depth = -10000
image_angle = random(360);
image_xscale = random_range(.7, 1);
image_yscale = image_xscale;
image_index = irandom(image_number - 1);
image_speed = 0;

shadow = map_create_shadow(x, y, id, sprite_index, image_index, .2);
wind_speed = random_range(sys_map_clouds.wind_strength_min, sys_map_clouds.wind_strength_max);

angle = random(360);
radius = random(100);
arc_length = random_range(1, 5);
rotation_speed = arc_length / radius;