/*
	This object does not draw itself. 
	Information in this object is used by sys_water to draw it to the water surface.
	
	This object does not position itself.
	The object that creates it sets is parameters and is responsible for setting its position.
*/

active = true;
scale = 1; //Shrinks as it disappears

//---- Drawing ----\\
width = 0;
height = 0;
size = 0; //Scales the size to the sprite size

//---- Bobbing animation ----\\
rot = 0;
rot_active = 0;
rot_distance = 0;
rot_speed = 0;
rot_offset = 4/sprite_width;

//---- Waterpoint ----\\
waterpoint_y = global.water_y;
waterpoint_dis = 0;