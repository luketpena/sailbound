
draw_set_alpha(.01);
draw_circle(x, y, viewRadius, false);
draw_set_alpha(.1);
draw_line(x, y, x+lengthdir_x(viewRadius, angle+viewAngle), y+lengthdir_y(viewRadius, angle+viewAngle));
draw_line(x, y, x+lengthdir_x(viewRadius, angle-viewAngle), y+lengthdir_y(viewRadius, angle-viewAngle));



draw_set_alpha(1);

draw_self();

draw_sprite_ext(sprite_index, 0, x, y, 1, 1, goalAngle, c_red, .1);
draw_text(x, y-32, goalAngle);