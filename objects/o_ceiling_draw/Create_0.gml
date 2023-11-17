//surf = -1;
baseColor = #11060C;
target = noone;
height = 512;

edgeSprite = s_ceiling_test;
baseheight = height - sprite_get_height(edgeSprite);
palette = palette_magmaCave;
savedPalette = {};
transitionedPalette = false;

unitWidth = ceiling.unit.width / sprite_get_width(edgeSprite);
surf = -1;