draw_sprite_ext(spr_town_gear_center_24x24, 0, x, y, 1, 1, 0, c_white, 1);

for (var i=0; i<toothCount; i++) {
	var a = (angleUnit * i + rot) mod 360;
	var xx = x + lengthdir_x(rad - 1, a);
	var yy = y + lengthdir_y(rad - 1, a);
	
	var hAlpha = fadeRange(a, 90, 90, 70, 110, 0, 1);
	
	draw_sprite_ext(spr_town_gear_tooth, 0, xx, yy, 4, toothWidth / 2, a, c_white, 1);
	draw_sprite_ext(spr_town_gear_tooth_highlight, 0, xx + lengthdir_x(4, a), yy + lengthdir_y(4, a), 1, toothWidth / 2, a, c_white, hAlpha);
}


draw_sprite_ext(spr_town_gear_center_24x24, 1, x, y + 1, 1, 1, rot, c_black, .5);
draw_sprite_ext(spr_town_gear_center_24x24, 1, x, y, 1, 1, rot, c_white, 1);
