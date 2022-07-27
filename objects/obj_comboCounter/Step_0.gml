if (fading) {
	if (image_alpha > 0) image_alpha -= .1 else instance_destroy();	
}

if (lerpValue < 1) lerpValue += .05;
scale = ease_lerp(EASE.OutElastic, 0, 1, lerpValue);