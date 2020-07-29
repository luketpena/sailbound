if (fade_wait>0) fade_wait-- else {
	if (image_alpha>0) image_alpha -= fade else instance_destroy();
}