inRange = point_distance(x, y - 32, o_town_player.draw_x, o_town_player.draw_y) < range;

if (inRange) {
	var nightFadeActive = (clock.nightFade > .5);

	aura.rot = (aura.rot + aura.getRate()) mod 360;
	aura.rateRot = (aura.rateRot + 5) mod 360;
	fireAnim = (fireAnim + .15) mod 6;

	if (!active && nightFadeActive) {
		if (lightDelay > 0) lightDelay-- else {
			active = true;
			light.on(.1);
			lightDelay_set();
		}
	} else if (active && !nightFadeActive) {
		if (lightDelay > 0) lightDelay-- else {
			active = false;
			light.off(.1);
			lightDelay_set();
		}
	}
}