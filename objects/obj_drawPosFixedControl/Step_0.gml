/// @description  Control

if (mouse_check_button_pressed(mb_left)) {
  i = -1;
  if (point_distance(mouse_x, mouse_y, 100+xx[0], 208+yy[0]) < 16) {
    i = 0;
  }
  if (point_distance(mouse_x, mouse_y, 356+xx[1], 208+yy[1]) < 16) {
    i = 1;
  }
  if (point_distance(mouse_x, mouse_y, 356+xx[2], 464+yy[2]) < 16) {
    i = 2;
  }
  if (point_distance(mouse_x, mouse_y, 100+xx[3], 464+yy[3]) < 16) {
    i = 3;
  }
  mx = mouse_x;
  my = mouse_y;
}

if (mouse_check_button(mb_left)) {
  if (i != -1) {
    xx[i] += mouse_x - mx;
    yy[i] += mouse_y - my;
    mx = mouse_x;
    my = mouse_y;
  }
}

