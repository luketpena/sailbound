//>> Tracking the waterpoint
waterpoint_y = water_find_y_basic(x);
waterpoint_dis = 1-min(abs(waterpoint_y-y)/height,1);

//>> Clearing instance when done
if (!active) {
	if (scale>0) scale -= .05 else instance_destroy();	
}

//>> Animating the bobbing motion
if (waterpoint_dis>0) {
	switch(rot_active) {
		case true:
			rot = (rot + rot_speed) mod 360;
			image_xscale = (size+lengthdir_x(rot_offset,rot));
			break;
			
		case false:
			image_xscale = size;
			break;
	}
	image_xscale *= scale*waterpoint_dis
} else {
	image_xscale = 0;
}

image_yscale = image_xscale;