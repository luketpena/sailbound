if (active) {
	if (grow<1) {
		grow += .05;
	
		for (var i=0; i<8; i++) {
			var point = bkg_point[i];
			var point_g = bkg_point_g[i];
		
			point[0] = lerp(bkg_c[0],point_g[0],grow);
			point[1] = lerp(bkg_c[1],point_g[1],grow);
		
			bkg_point[i] = point;
		}
	} else {
	
		if (genie_lerp<1) genie_lerp += .1;
	
		if (!text_complete) {	
			if (text_pos<text_length) text_pos += 1 else text_complete = true;
		} else {
			nextButton_rot = (nextButton_rot+10) mod 360;
		if (nextButton_lerp<1) nextButton_lerp += .01;
		nextButton_size = ease_lerp(EASE.OutElastic,0,1,nextButton_lerp);
		}
	}
} else {
	if (genie_lerp>0) genie_lerp -= .1 else {
		if (text_alpha>0) text_alpha -= .1 else {
			if (grow>0) {
				grow -= .1;
				for (var i=0; i<8; i++) {
					var point = bkg_point[i];
					var point_g = bkg_point_g[i];
		
					point[0] = lerp(bkg_c[0],point_g[0],grow);
					point[1] = lerp(bkg_c[1],point_g[1],grow);
		
					bkg_point[i] = point;
				}
			}
		}
	}
}