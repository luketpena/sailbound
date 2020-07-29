lighting_flash_step();
floater_step(0);

if (active) {
	if (move_vspeed<5) move_vspeed += .1;
	image_angle -= move_hspeed;
}

x += move_hspeed;
y += move_vspeed;

if (y>ystart) instance_destroy();

if (bounce_lerp<1) {
	bounce_lerp += .025;
	image_xscale = ease_lerp(EASE.OutElastic,1.5,1,bounce_lerp);
	image_yscale = ease_lerp(EASE.OutElastic,.5,1,bounce_lerp);
}