if (fadeRate > 0) {
	if (fadeDelay > 0) fadeDelay-- else {
		if (image_alpha > 0) image_alpha -= fadeRate else instance_destroy();
	}
}

if (active && image_alpha < targetAlpha) {
	image_alpha = min(image_alpha + activeRate, targetAlpha);	
}

if (!active && image_alpha > 0) {
	image_alpha = max(image_alpha - activeRate, 0);	
}