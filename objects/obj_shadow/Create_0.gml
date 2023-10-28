/*
	This object does not draw itself. 
	Information in this object is used by sys_water to draw it to the water surface.
	
	This object does not position itself.
	The object that creates it sets is parameters and is responsible for setting its position.
*/

//---- Drawing ----\\
width = 52;
height = 16;
size = width/sprite_width; //Scales the size to the sprite size

//---- Waterpoint ----\\
waterpoint_y = global.water_y;
waterpoint_dis = 0;

function init() {
	size = width/sprite_width;	
}