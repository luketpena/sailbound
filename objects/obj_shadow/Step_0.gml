//>> Tracking the waterpoint
waterpoint_y = water_find_y_basic(x);
waterpoint_dis = 1-min(abs(waterpoint_y-y)/height,1);

//>> Animating the bobbing motion
if (waterpoint_dis>0) {
	image_xscale = size*waterpoint_dis;
} else {
	image_xscale = 0;
}

image_yscale = image_xscale;