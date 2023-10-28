active = false;
ships = [];

select = 0;

function open() {
	active = true;
	var _activeHulls = vault.inventory.getActiveHulls();
	ships = array_map(_activeHulls, function(_key) {
		return catalogue_ships[$ _key];
	});
}
