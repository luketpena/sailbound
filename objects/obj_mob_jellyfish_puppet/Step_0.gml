tail.x += (x - tail.x) * .3;
tail.y += ((y + height) - tail.y) * .1;
tail.y = max(tail.y, y);

if (bounce.active) {
	if (bounce.lerpPos < 1) {
		bounce.lerpPos += bounce.rate;
		image_xscale = ease_lerp(EASE.OutBounce, .65, image_xscale_target, bounce.lerpPos);
		image_yscale = ease_lerp(EASE.OutBounce, .5, image_yscale_target, bounce.lerpPos);
	} else {
		bounce.active = false;
	}
} else {
	image_xscale = image_xscale_target;
	image_yscale = image_yscale_target;
}

// This layers the breathing animation on top of any other ongoing animation
breath.rot = (breath.rot + breath.rate) mod 360;
image_xscale += lengthdir_x(.1, breath.rot);
image_yscale += lengthdir_x(.1, breath.rot + 90);
