x -= global.water_speed * 2;

ringBelow.x = x;
slide = x / room_width;
face = (slide > .5) ? -1 : 1;
image_xscale = lerp(-1, 1, slide);

offset = lerp(1, 3, 1 - abs(image_xscale));

if (distanceFromBoat(x, y) < 32) open();

lighting_flash_step();

if (opened) {
	if (openLerp < 1) openLerp += .05;
	openAnim = ease_lerp(EASE.OutElastic, 0, 16, openLerp) * image_xscale;
	ringBelow.openAnim = openAnim;
}


ringBelow.offset = offset;
ringBelow.face = face;
ringBelow.slide = slide;
ringBelow.topY = topY;
ringBelow.bottomY = bottomY;
ringBelow.image_xscale = image_xscale;
ringBelow.image_alpha = image_alpha;
ringBelow.flash = flash;

if (x < 0) instance_destroy();
if (fade) {
	if (image_alpha > 0) image_alpha -= .1 else instance_destroy();
}