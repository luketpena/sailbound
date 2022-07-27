//draw_sprite_ext(spr_ring, 1, x, y, 1, 1, 0, c_white, 1);
var sideX = x - openAnim + lerp(30, -30, slide);
var insideX = x - openAnim + lerp(6, -6, slide);

var edgeX = x - openAnim + lerp(11, -11, slide);
var insideSideX = x - openAnim + lerp(24, -24, slide);

var insideScale = offset / 3;

lighting_flash_draw();
draw_sprite_ext(spr_ring_side, 0, sideX + offset * face, y, -image_xscale, 1, 0, c_white, image_alpha);
draw_sprite_ext(spr_ring_inside, 0, insideX, y, insideScale, 1, 0, c_white, image_alpha);

draw_sprite_pos(spr_ring_insideEdge, 0,
	edgeX + offset, topY + 6,
	edgeX - offset, topY + 6,
	insideSideX - offset, y,
	insideSideX + offset, y,
	image_alpha);
	
draw_sprite_pos(spr_ring_insideEdge, 1,
	edgeX + offset, bottomY - 6,
	edgeX - offset, bottomY - 6,
	insideSideX - offset, y,
	insideSideX + offset, y,
	image_alpha);
lighting_flash_clear();