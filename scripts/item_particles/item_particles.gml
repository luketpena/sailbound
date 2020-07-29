// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pt_make_spark(){
	//spark
	global.pt_spark = part_type_create();
	part_type_sprite(global.pt_spark, spr_pixel, 0, 0, 0);
	part_type_size(global.pt_spark, 0.50, 1, 0, 0);
	part_type_scale(global.pt_spark, 3, 1);
	part_type_orientation(global.pt_spark, 0, 0, 0, 0, 1);
	part_type_color3(global.pt_spark, 65535, 4235519, 255);
	part_type_alpha3(global.pt_spark, 1, 0.67, 0);
	part_type_life(global.pt_spark, 5, 40);
	part_type_speed(global.pt_spark, 0.20, 1, 0, 0);
	part_type_direction(global.pt_spark, 0, 360, 0, 0);
	part_type_gravity(global.pt_spark, 0.01, 270);
}