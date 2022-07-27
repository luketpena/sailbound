if (active) {
	if (animLerp < 1) {
		scaleOuter = lerp(scaleTarget * .5, scaleTarget, animLerp);
		scaleInner = lerp(0, scaleTarget, animLerp);
		animLerp += rate;
	} else {
		instance_destroy();	
	}
}