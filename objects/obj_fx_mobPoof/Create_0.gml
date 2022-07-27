animLerp = 0;
scaleTarget = 0;
scaleOuter = 0;
scaleInner = 0;
durationInSeconds = .1;
rate = (1 / (60 * durationInSeconds)) * .5;

active = false;

function init(radius) {
	scaleTarget = radius / 50;
	active = true;
	calculateDuration(scaleTarget);
	
	var poofCount = lerp(5, 30, scaleTarget);
	for (var i=0; i<poofCount; i++) {
		var dir = irandom(360);
		var xx = x + lengthdir_x(radius * .5, dir);
		var yy = y + lengthdir_y(radius * .5, dir);
		
		var o = instance_create_layer(xx, yy, layer, obj_fx_mobPoof_swirl);
		o.init(dir, scaleTarget);
	}
}

function calculateDuration(lerpVal) {
	durationInSeconds = lerp(.08, .2, lerpVal);
	rate = (1 / (60 * durationInSeconds)) * .5;	
}

surf = null;