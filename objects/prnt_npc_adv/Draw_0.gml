draw_x += (x-draw_x)*.4;
draw_y += (y-draw_y)*.4;

draw_sprite_ext(sprite_index, image_index, round(draw_x), round(draw_y), face_draw, 1, 0, c_white, 1);


physics_draw_debug();
