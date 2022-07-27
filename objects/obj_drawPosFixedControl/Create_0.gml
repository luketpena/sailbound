/// @description  Init
// NOTE: You should only create a format once at the start of the game

vertex_format_begin();
vertex_format_add_colour();
vertex_format_add_position();
vertex_format_add_normal();


/// Control
application_surface_enable(0);
display_reset(8, 0);

xx[0] = 0;
yy[0] = 0;
xx[1] = 0;
yy[1] = 0;
xx[2] = 0;
yy[2] = 0;
xx[3] = 0;
yy[3] = 0;

mx = 0;
my = 0;
i = -1;

