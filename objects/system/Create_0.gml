/*
	The system holds high-level information and generates the other rooms.
*/

//>> Setup
application_surface_enable(true);
os_lock_orientation(true);
window_set_fullscreen(true);
show_debug_overlay(true);

//>> Initialization
cameraSystem_init();

//>> Fonts
global.font_numbers_large = font_add_sprite_ext(spr_font_numbers_large,"0123456789",true,2);
global.font_normal_medium = font_add_sprite_ext(spr_font_normal_medium,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?:;'$%()-@",true,2);
global.font_normal_small = font_add_sprite_ext(spr_font_normal_small,"ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789.,!?:;'$%()-@+/abxy$*",true,1);

instance_create_layer(0,0,"l_system",settings);
instance_create_layer(0,0,"l_system",sys_testControls);