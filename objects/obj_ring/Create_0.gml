ringBelow = instance_create_layer(x, y, layer, obj_ring_below);
slide = x / room_width;
face = 1;
topY = y - 32;
bottomY = y + 32;
offset = 0;

opened = false;
openLerp = 0;
openAnim = 0;
fade = false;

function open() {
	if (!opened) {
		opened = true;
		alarm[0] = .5 * room_speed;
		light_create(x, y, spr_fx_flare_300, 0, 1, 1, c_gold, 1, 0, .05);
		vibrate_set_impulse(.2);
		lighting_flash_set();
		
		if (global.rings < 9) global.rings ++ else {
			global.rings = 0;
			boat_heal(4);
		}
	}
}

lighting_flash_init();