draw_sprite_ext(spr_hud_combo, 0, x, y, scale, scale, 0, c_white, image_alpha);
draw_set_style(global.font_normal_medium, c_gold, fa_center, fa_top, image_alpha);
draw_set_alpha(image_alpha);
draw_text_transformed(x, y + 8, "X" + string(count), scale, scale, 0);