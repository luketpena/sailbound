for (var i=0; i<puffNum; i++) {
	var puff = puff_list[i];
	if (puff.speed > .25) then puff.speed *= .9 else {
		puff.speed *= .95;
		puff.alpha = clamp(puff.alpha-puff.fade, 0, 1);
	}
	
	puff.angle -= puff.rot * puff.flip;
	
	
	var water_y = water_find_y_basic(puff.x);
	
	puff.x += lengthdir_x(puff.speed, puff.dir);
	
	
	if (!belowWater) {
		if (puff.y>water_y-18) {
			puff.y -= puff.speed;
			puff.dir -= angle_difference(puff.dir, 90)*.25;
		} else puff.y += lengthdir_y(puff.speed, puff.dir);	
	} else {
		if (puff.y<water_y+18) {
			puff.y += puff.speed;
			puff.dir -= angle_difference(puff.dir, 270)*.25;
		} else puff.y += lengthdir_y(puff.speed, puff.dir);	
	}
	
	if (puff.color_fade < 1) {
		puff.color_fade += puff.color_fade_rate;
		puff.color = merge_color(c_orange, $222233, puff.color_fade);
	}
}
