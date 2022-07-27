var angle = lerp(168, 150, lengthdir_x(.5, rot) + .5);
var wheelRotPoint = -rot + 55;
var endX = x + lengthdir_x(64, angle);
var endY = y - 2 + lengthdir_y(64, angle);
var pistonAngle = point_direction(x - 64 + lengthdir_x(10, wheelRotPoint), y + lengthdir_y(10, wheelRotPoint), endX, endY);

draw_sprite_ext(spr_town_shipwright_bellows_supports, 1, x, y, 1, 1, 0, c_white, 1);

draw_primitive_begin_texture(pr_trianglelist, tex);
	draw_vertex_texture(endX, endY, 0, 0);
	draw_vertex_texture(x, y, 1, .5);
	draw_vertex_texture(x-64, y, 0, 1);
draw_primitive_end();

draw_sprite_ext(spr_town_shipwright_bellows_outer, 0, x, y, 1, 1, 180, c_white, 1);
draw_sprite_ext(spr_town_shipwright_bellows_outer, 0, x, y - 2, 1, -1, angle, c_white, 1);

draw_sprite_ext(spr_town_shipwright_bellows_tip, 0, x - 2, y - 2, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_town_shipwright_bellows_supports, 0, x, y, 1, 1, 0, c_white, 1);

draw_sprite_ext(spr_town_shipwright_bellows_wheel, 0, x - 64, y, 1, 1, wheelRotPoint, c_white, 1);

draw_sprite_ext(spr_town_shipwright_bellows_pistonJoint, 0, endX, endY, 1, 1, pistonAngle - 180, c_white, 1);
draw_sprite_ext(spr_town_shipwright_bellows_pistonJoint, 1, x - 64 + lengthdir_x(10, wheelRotPoint), y + lengthdir_y(10, wheelRotPoint), 1, 1, pistonAngle, c_white, 1);





//draw_line(x - 64 + lengthdir_x(10, wheelRotPoint), y + lengthdir_y(10, wheelRotPoint), endX, endY);
