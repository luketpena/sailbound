active = false;
floatMove_init(3, .15);
floatMove_speed_set_dir(random(360), 2);

x = room_width + 128;
y = global.water_y - 128;

shipId = "";


function init(_shipId) {
	shipId = _shipId
	sprite_index = catalogue_ships[$ _shipId].orbSprite;
	levelPercent = vault.inventory.hull[$ _shipId].levelPercent;
}

function activate() {
	active = true;
	array_push(sys_gameplay.hullOrbsCollected, shipId);	
}