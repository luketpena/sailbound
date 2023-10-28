rotSub = new Rotator(random_range(1, 3), 1);
rotMain = new Rotator(random_range(1, 3), 2, rotSub, 5);
flip = choose(-1, 1);
var side = x + (sprite_width * flip);

image_index = (x + y) mod sprite_get_number(sprite_index);
image_speed = 0;

// Top left
pos1 = new Pos(side, y-sprite_height);
// Top right
pos2 = new Pos(x, y-sprite_height);
// Bottom right
pos3 = new Pos(x, y);
// Bottom left
pos4 = new Pos(side, y);