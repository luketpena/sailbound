///@description Finds the collision point in a direction; returns vector2 coordinates;
///@param angle
///@param range
///@param quality
///@param start_x
///@param start_y
///@param target
///@param prec
function collision_impact(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var a = argument0;
	var r = argument1;
	var h = r*.5;

	var x1 = argument3;
	var y1 = argument4;
	var x2 = x1+lengthdir_x(r,a);
	var	y2 = y1+lengthdir_y(r,a);

	var q;
	if (argument2=-1) q = log2(r) else q = argument2;

	for (var i=0; i<=q; i++) 
	{
		x2 = x1+lengthdir_x(r,a);
		y2 = y1+lengthdir_y(r,a);
		if (collision_line(x1,y1,x2,y2,argument5,argument6,1) = noone) {
			if (i=0) return [x2,y2] else r  += h;
		} else r -= h;
		h *= .5;
	}
	return [x2,y2];


}
