image_xscale_target = .9;
image_yscale_target = .9;
length = irandom(3);
height = (length + 1) * 16;

tailTex = sprite_get_texture(spr_mob_jellyfish_tail, length);

tail = {
	x: x,
	y: y
}

bounce = {
	active: false,
	lerpPos: 0,
	rate: .025,
}

breath = {
	rot: random(360),
	rate: 5,
}

function triggerBounce() {
	bounce.active = true;
	bounce.lerpPos = 0;
}
