front_surface = noone;

water_num = sys_water.water_num;
water_halfNum = sys_water.water_halfNum;
water_alpha_mid = sys_water.water_alpha_mid;
water_alpha_low = sys_water.water_alpha_low;

water_point_x = [];
water_texture_x = [];
water_draw_x_low = [];

array_copy(water_point_x,0,sys_water.water_point_x,0,array_length_1d(sys_water.water_point_x));
array_copy(water_texture_x,0,sys_water.water_texture_x,0,array_length_1d(sys_water.water_texture_x));
array_copy(water_draw_x_low,0,sys_water.water_draw_x_low,0,array_length_1d(sys_water.water_draw_x_low));

pt_init_water_front_current();

pe_water_front = part_emitter_create(global.ps_water_front);
part_emitter_region(global.ps_water_front,pe_water_front,0,room_width,global.water_y-128,room_height,ps_shape_rectangle,ps_distr_linear);
part_emitter_stream(global.ps_water_front,pe_water_front,pt_water_front_current,1);

