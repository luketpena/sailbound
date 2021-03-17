function collision_impact(angle, range, quality, start_x, start_y, target, prec) {
	var h = range*.5;

	var x2 = start_x+lengthdir_x(range,angle);
	var	y2 = start_y+lengthdir_y(range,angle);

	var q = compare((quality = -1), log2(range), quality);

	for (var i=0; i<=q; i++) 
	{
		x2 = start_x+lengthdir_x(range ,angle);
		y2 = start_y+lengthdir_y(range, angle);
		if (collision_line(start_x, start_y, x2 ,y2 ,target ,prec, 1) = noone) {
			if (i=0) return [x2,y2] else range  += h;
		} else range -= h;
		h *= .5;
	}
	return [x2,y2];
}

// The inverse of an impact: finds where the collision stops rather than starts
function collision_release(angle, range, quality, start_x, start_y, target, prec) {
	var h = range*.5;

	var x2 = start_x+lengthdir_x(range, angle);
	var	y2 = start_y+lengthdir_y(range, angle);

	var q;
	if (quality=-1) q = log2(range) else q = quality;

	for (var i=0; i<=q+2; i++) 
	{
		x2 = start_x+lengthdir_x(range, angle);
		y2 = start_y+lengthdir_y(range, angle);
		if (collision_point(x2, y2, target, prec, 1)) {
			if (i=0) return [x2,y2] else range  += h;
		} else range -= h;
		h *= .5;
	}
	return [x2,y2];
}

function collision_impact_rectangle_h(range, quality, start_y1, start_y2, start_x, target, prec) {
	var h = range*.5;
	var	x2 = start_x+range;

	var q = compare((quality = -1), floor(log2(abs(range)))+2, quality);
	
	for (var i=0; i<=q; i++) 
	{
		x2 = start_x+range;
		if (collision_rectangle(start_x,start_y1,x2,start_y2,target,prec,true) = noone) {
			if (i=0) return x2 else range += h;
		} else range -= h;
		h *= .5;
	}
	return floor(x2);
}

function collision_impact_rectangle_v(range, quality, start_x1, start_x2, start_y, target, prec) {
	var h = range*.5;
	var	y2 = start_y+range;

	var q = compare( (quality = -1), q = floor(log2(range))+2, quality);

	for (var i=0; i<=q; i++) 
	{
		y2 = start_y+range;
		if (collision_rectangle(start_x1, start_y, start_x2, y2, target, prec, true) = noone) {
			if (i=0) return y2 else range += h;
		} else range -= h;
		h *= .5;
	}
	return floor(y2);
}
