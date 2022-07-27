draw_set_color(c_white);
draw_set_alpha(1);

var width = (32 * image_xscale);
var height = (32 * image_yscale);

draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x + width / 2, y + height / 2, text);