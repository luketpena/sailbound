draw_set_style(global.font_normal_small,-1,fa_left,fa_middle,-1);
//draw_text_color1(16,global.hvh,"FPS: " + string(fps),c_lime,1);
draw_text_color1(16,global.hvh,test_array,c_lime,1);
draw_text_color1(16,global.hvh+16,string_upper(test_value),c_lime,1);

if (keyboard_check_pressed(ord("T"))) {
	var change = array_insert(test_array, 99, 55);
	test_array = change;
	//test_value = change.value;
}