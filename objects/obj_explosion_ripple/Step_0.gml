if (scale_lerp < 1) {
	scale_lerp += .01;
	scale = ease_lerp(EASE.OutCubic, size_min, size_max, scale_lerp);
	
}

if (scale_lerp > .3) {
	if (image_alpha > 0) image_alpha -= .05 else instance_destroy();
} else {
	if (image_alpha < 1) image_alpha += .1	
}