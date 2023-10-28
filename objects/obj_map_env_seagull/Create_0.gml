event_inherited();
minHeight = irandom_range(24, 48);
maxHeight = minHeight;

image_angle = random(360);
moveSpeed = random_range(.25, .75);

shadow = instance_create_layer(x, y, "l_shadows", o_map_shadow);
shadow.sprite_index = sprite_index;

target = instance_nearest(x, y, prnt_map_stacked_object);
targetTimer = 0;
targetTimerMax = seconds(3);
targetTimerMin = seconds(1);

targetX = x;
targetY = y;

targetRadius = 32;

turnRate = random_range(.005, .02);

function drawLayer(index) {
	draw_sprite_ext(sprite_index, 0, x + offsetX, y + offsetY, 1, 1, image_angle, c_white, 1);	
}