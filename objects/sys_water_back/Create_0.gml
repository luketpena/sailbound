/*
	Draws the dyanmic water that goes behind the objects in the scene.
	Is dependant on the sys_water object.
*/

water_num = sys_water.water_num;
water_halfNum = sys_water.water_halfNum;
water_alpha_mid = sys_water.water_alpha_mid;

water_point_x = [];
water_texture_x = [];
water_draw_x_top = [];

array_copy(water_point_x,0,sys_water.water_point_x,0,array_length_1d(sys_water.water_point_x));
array_copy(water_texture_x,0,sys_water.water_texture_x,0,array_length_1d(sys_water.water_texture_x));
array_copy(water_draw_x_top,0,sys_water.water_draw_x_top,0,array_length_1d(sys_water.water_draw_x_top));

