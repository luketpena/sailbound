image_blend = c_fuchsia;
draw_set_color(image_blend);

draw_set_alpha(1);
draw_rectangle(x, y, x+image_xscale, y+image_yscale, 1);

draw_set_alpha(.1);
draw_rectangle(x, y, x+image_xscale, y+image_yscale, 0);