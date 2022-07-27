image_blend = merge_color(c_front, c_water_depth, .5 * clusterDepth);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);

if (cluster.targetActive) {
	draw_set_color(c_yellow);
	draw_arrow(x, y, cluster.target.x, cluster.target.y, 2);	
}