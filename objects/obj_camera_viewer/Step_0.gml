var mouse_pos_x = (global.midx-mouse_x)/global.hvw;
var mouse_pos_y = (global.midy-mouse_y)/global.hvh;

camera_set_view_pos(view_camera[0],global.vx-4*mouse_pos_x,global.vy-4*mouse_pos_y);