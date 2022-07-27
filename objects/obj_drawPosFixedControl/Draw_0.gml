/// @description  Draw

// texture
draw_sprite_pos_fixed(s_texture, 0, 100+xx[0], 208+yy[0], 356+xx[1], 208+yy[1], 356+xx[2], 464+yy[2], 100+xx[3], 464+yy[3], c_white, 1);
draw_sprite_pos(s_texture, 0, 456+xx[0], 208+yy[0], 712+xx[1], 208+yy[1], 712+xx[2], 464+yy[2], 456+xx[3], 464+yy[3], 1);

// sprite
draw_sprite_pos_fixed(s_sprite, 0, 812+xx[0], 240+yy[0], 932+xx[1], 240+yy[1], 932+xx[2], 431+yy[2], 812+xx[3], 431+yy[3], c_white, 1);
draw_sprite_pos(s_sprite, 0, 1032+xx[0], 240+yy[0], 1152+xx[1], 240+yy[1], 1152+xx[2], 431+yy[2], 1032+xx[3], 431+yy[3], 1);

/// Control

draw_set_colour($b98029);
if (mouse_check_button(mb_left)) {
  if (i != -1) {
    draw_circle(100+xx[0], 208+yy[0], 8, 1);
    draw_circle(356+xx[1], 208+yy[1], 8, 1);
    draw_circle(356+xx[2], 464+yy[2], 8, 1);
    draw_circle(100+xx[3], 464+yy[3], 8, 1);
  }
}

draw_set_colour($503e2c);
draw_set_font(f_roboto);
draw_text(180, 482, string_hash_to_newline("FIXED"));
draw_text(492, 482, string_hash_to_newline("STANDARD"));
draw_text(824, 482, string_hash_to_newline("FIXED"));
draw_text(1002, 482, string_hash_to_newline("STANDARD"));

